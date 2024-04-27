const std = @import("std");
const print = std.debug.print;
const expect = std.testing.expect;
const heap = std.heap;
const mem = std.mem;

pub fn main() !void {
    var gpa = heap.GeneralPurposeAllocator(.{}){};
    var arena = heap.ArenaAllocator.init(gpa.allocator());
    defer arena.deinit();

    var s = [_]u8{ 5, 3, 6, 2, 10 };

    print("{d}\n", .{try quicksort(u8, arena.allocator(), &s)});
}

fn quicksort(comptime T: type, allocator: mem.Allocator, s: []const T) anyerror![]const T {
    // base case, arrays with 0 or 1 element are already "sorted"
    if (s.len < 2) {
        return s;
    }

    var lower = std.ArrayList(T).init(allocator);
    var higher = std.ArrayList(T).init(allocator);

    const pivot = s[0];
    for (s[1..]) |item| {
        if (item <= pivot) {
            try lower.append(item);
        } else {
            try higher.append(item);
        }
    }

    const low = try quicksort(T, allocator, lower.items);
    const high = try quicksort(T, allocator, higher.items);

    var res = std.ArrayList(T).init(allocator);
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
        const check = gpa.deinit();
        if (check == .leak) std.testing.expect(false) catch @panic("TEST FAIL"); //fail test; can't try in defer as defer is executed after we return
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
        const res = try quicksort(u8, arena.allocator(), t.s);
        try expect(res.len == t.exp.len);
        for (res, 0..) |e, i|
            try expect(e == t.exp[i]);
    }
}
