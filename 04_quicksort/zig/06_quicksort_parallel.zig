const std = @import("std");
const print = std.debug.print;
const expect = std.testing.expect;
const heap = std.heap;
const mem = std.mem;

// pub const io_mode = .evented;

pub fn main() !void {
    var gpa = heap.GeneralPurposeAllocator(.{}){};
    var arena = heap.ArenaAllocator.init(gpa.allocator());
    defer arena.deinit();

    var u = [_]u8{ 5, 3, 6, 2, 10 };

    var s = try std.ArrayList(u8).initCapacity(arena.allocator(), u.len);
    try quicksort(u8, arena.allocator(), &u, &s);
    print("{d}\n", .{s.items});
}

fn quicksort(comptime T: type, allocator: mem.Allocator, u: []const T, s: *std.ArrayList(T)) !void {
    if (u.len < 2) {
        try s.appendSlice(u);
        return;
    }

    var lower = std.ArrayList(T).init(allocator);
    var higher = std.ArrayList(T).init(allocator);

    const pivot = u[0];
    for (u[1..]) |item| {
        if (item <= pivot) {
            try lower.append(item);
        } else {
            try higher.append(item);
        }
    }

    // NOTE: zig has temporary removed the async/await syntax since v0.11.0
    //
    // const low_frame = try allocator.create(@Frame(quicksort));
    // low_frame.* = async quicksort(allocator, lower.items);
    // const high = try quicksort(allocator, higher.items);
    // const low = try await low_frame;

    var low = try std.ArrayList(T).initCapacity(allocator, lower.items.len);
    var high = try std.ArrayList(T).initCapacity(allocator, higher.items.len);

    var low_handle = try std.Thread.spawn(
        .{},
        quicksort,
        .{ T, allocator, lower.items, &low },
    );
    var high_handle = try std.Thread.spawn(
        .{},
        quicksort,
        .{ T, allocator, higher.items, &high },
    );
    low_handle.join();
    high_handle.join();

    const lows = try low.toOwnedSlice();
    const highs = try high.toOwnedSlice();
    try s.appendSlice(lows);
    try s.append(pivot);
    try s.appendSlice(highs);

    return;
}

test "quicksort" {
    var arena = heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();

    const tests = [_]struct {
        s: []const u8,
        exp: []const u8,
    }{
        .{
            .s = &[_]u8{},
            .exp = &[_]u8{},
        },
        .{
            .s = &[_]u8{42},
            .exp = &[_]u8{42},
        },
        .{
            .s = &[_]u8{ 3, 2, 1 },
            .exp = &[_]u8{ 1, 2, 3 },
        },
    };

    for (tests) |t| {
        var res = std.ArrayList(u8).init(arena.allocator());
        try quicksort(u8, arena.allocator(), t.s, &res);
        try expect(res.items.len == t.exp.len); // length not matching
        for (res.items, 0..) |e, i|
            try expect(e == t.exp[i]); // element not matching
    }
}
