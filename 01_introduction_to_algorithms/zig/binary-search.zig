const std = @import("std");
const print = std.debug.print;
const expect = std.testing.expect;

pub fn main() void {
    const my_list = &[_]i8{ 1, 3, 5, 7, 9 };

    print("{?}\n", .{binarySearch(i8, my_list, 3)});
    print("{?}\n", .{binarySearch(i8, my_list, -1)});
}

fn binarySearch(comptime T: type, list: []const T, item: T) ?usize {
    var low: i32 = 0;
    var high: i32 = @intCast(i32, list.len) - 1;

    return while (low <= high) {
        var mid = @divTrunc((low + high), 2);
        var m = @intCast(usize, mid);
        var guess = list[m];
        if (guess == item) break m;
        if (guess > item) {
            high = mid - 1;
        } else low = mid + 1;
    } else null;
}

test "binarySearch" {
    const my_list = &[_]i8{ 1, 3, 5, 7, 9 };

    var i = binarySearch(i8, my_list, 3);
    try expect(i != null);
    try expect(i.? == 1);

    i = binarySearch(i8, my_list, -1);
    try expect(i == null);
}
