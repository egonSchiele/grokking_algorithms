const std = @import("std");
const print = std.debug.print;
const expect = std.testing.expect;

pub fn main() !void {
    var s = [_]i32{ 5, 3, 6, 2, 10 };

    selectionSort(i32, s[0..]);
    print("{d}\n", .{s});
}

fn selectionSort(comptime T: type, list: []T) void {
    for (0..list.len) |i| {
        var j = i + 1;
        while (j < list.len) : (j += 1) {
            if (list[i] > list[j]) {
                // swap
                const tmp = list[i];
                list[i] = list[j];
                list[j] = tmp;
            }
        }
    }
}

test "selectionSort" {
    var s = [_]i32{ 5, 3, 6, 2, 10 };
    const exp = [_]i32{ 2, 3, 5, 6, 10 };

    selectionSort(i32, s[0..]);

    try expect(s.len == exp.len);
    for (s, 0..) |e, i|
        try expect(e == exp[i]);
}
