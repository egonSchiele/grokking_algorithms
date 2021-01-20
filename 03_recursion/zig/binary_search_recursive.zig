const print = @import("std").debug.print;
const expect = @import("std").testing.expect;

pub fn main() void {
    print("{}\n", .{binarySearch(&[_]i32{ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, 2)});
}

fn binarySearch(arr: []const i32, target: i32) bool {
    switch (arr.len) {
        0 => return false,
        1 => return arr[0] == target,
        else => {
            const mid = arr.len / 2;
            if (arr[mid] > target) {
                return binarySearch(arr[0..mid], target);
            } else {
                return binarySearch(arr[mid..], target);
            }
        },
    }
}

test "binary search recursive" {
    const tests = [_]struct {
        arr: []const i32,
        target: i32,
        exp: bool,
    }{
        .{
            .arr = &[_]i32{ 1, 2, 3, 4, 5, 6, 7, 8, 9 },
            .target = 7,
            .exp = true,
        },
        .{
            .arr = &[_]i32{ 1, 2, 3, 4, 5, 6, 7, 8, 9 },
            .target = 42,
            .exp = false,
        },
        .{
            .arr = &[_]i32{42},
            .target = 42,
            .exp = true,
        },
        .{
            .arr = &[_]i32{1},
            .target = 42,
            .exp = false,
        },
        .{
            .arr = &[_]i32{},
            .target = 42,
            .exp = false,
        },
    };

    for (tests) |t| {
        expect(binarySearch(t.arr, t.target) == t.exp);
    }
}
