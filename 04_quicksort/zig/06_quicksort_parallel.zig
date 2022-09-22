const std = @import("std");
const print = std.debug.print;
const expect = std.testing.expect;
const heap = std.heap;
const mem = std.mem;

pub const io_mode = .evented;

pub const Error = error{OutOfMemory};

pub fn main() !void {
    var gpa = heap.GeneralPurposeAllocator(.{}){};
    var arena = heap.ArenaAllocator.init(gpa.allocator());
    defer arena.deinit();

    var s = [_]u8{ 5, 3, 6, 2, 10 };

    print("{d}\n", .{try quicksort(arena.allocator(), &s)});
}

// NOTE: this async version cannot be generic because allocating a frame for a
// generic function is not trivial.
fn quicksort(allocator: mem.Allocator, s: []const u8) Error![]const u8 {
    if (s.len < 2) {
        return s;
    }

    var lower = std.ArrayList(u8).init(allocator);
    var higher = std.ArrayList(u8).init(allocator);

    const pivot = s[0];
    for (s[1..]) |item| {
        if (item <= pivot) {
            try lower.append(item);
        } else {
            try higher.append(item);
        }
    }

    const low_frame = try allocator.create(@Frame(quicksort));
    low_frame.* = async quicksort(allocator, lower.items);
    var high = try quicksort(allocator, higher.items);
    var low = try await low_frame;

    var res = std.ArrayList(u8).init(allocator);
    try res.appendSlice(low);
    try res.append(pivot);
    try res.appendSlice(high);

    return res.items;
}

test "quicksort" {
    var gpa = heap.GeneralPurposeAllocator(.{}){};
    var arena = heap.ArenaAllocator.init(gpa.allocator());
    defer {
        arena.deinit();
        const leaked = gpa.deinit();
        if (leaked) std.testing.expect(false) catch @panic("TEST FAIL"); //fail test; can't try in defer as defer is executed after we return
    }

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
        var res = try quicksort(arena.allocator(), t.s);
        try expect(res.len == t.exp.len);
        for (res) |e, i|
            try expect(e == t.exp[i]);
    }
}
