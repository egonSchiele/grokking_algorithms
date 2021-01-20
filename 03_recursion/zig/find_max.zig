const print = @import("std").debug.print;
const expect = @import("std").testing.expect;

pub fn main() void {
    print("{}\n", .{findMax(&[_]i32{ 1, 2, 3, 4 })});
}

fn findMax(arr: []const i32) i32 {
    switch (arr.len) {
        0 => return 0,
        1 => return arr[0],
        else => {
            const x = findMax(arr[1..]);
            if (arr[0] > x) {
                return arr[0];
            } else return x;
        },
    }
}

test "find max" {
    const tests = [_]struct {
        arr: []const i32,
        exp: i32,
    }{
        .{
            .arr = &[_]i32{ 1, 2, 3, 4 },
            .exp = 4,
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
        expect(findMax(t.arr) == t.exp);
    }
}
