const print = @import("std").debug.print;
const expect = @import("std").testing.expect;

pub fn main() void {
    print("{}\n", .{sumArray(&[_]i32{ 1, 2, 3, 4 })});
}

fn sumArray(arr: []const i32) i32 {
    switch (arr.len) {
        0 => return 0,
        1 => return arr[0],
        else => return arr[0] + sumArray(arr[1..]),
    }
}

test "sum array" {
    const tests = [_]struct {
        arr: []const i32,
        exp: i32,
    }{
        .{
            .arr = &[_]i32{ 1, 2, 3, 4 },
            .exp = 10,
        },
        .{
            .arr = &[_]i32{42},
            .exp = 42,
        },
        .{
            .arr = &[_]i32{},
            .exp = 0,
        },
    };

    for (tests) |t| {
        expect(sumArray(t.arr) == t.exp);
    }
}
