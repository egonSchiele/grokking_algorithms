const std = @import("std");
const print = std.debug.print;
const expect = std.testing.expect;

pub fn main() void {
    comptime const my_list = [_]i8{ 1, 3, 5, 7, 9 };

    print("{}\n", .{binarySearch(my_list[0..], 3)});
    print("{}\n", .{binarySearch(my_list[0..], -1)});
}

fn binarySearch(comptime list: []const i8, comptime item: i8) ?usize {
    var low: i32 = 0;
    var high: i32 = list.len - 1;

    return while (low <= high) {
        var mid = @intCast(usize, @divTrunc((low + high), 2));
        var guess = list[mid];
        if (guess == item) return mid;
        if (guess > item) {
            high = @intCast(i32, mid) - 1;
        } else low = @intCast(i32, mid) + 1;
    } else null;
}

test "binarySearch" {
    comptime const my_list = [_]i8{ 1, 3, 5, 7, 9 };

    var i = binarySearch(my_list[0..], 3);
    expect(i != null);
    expect(i.? == 1);

    i = binarySearch(my_list[0..], -1);
    expect(i == null);
}
