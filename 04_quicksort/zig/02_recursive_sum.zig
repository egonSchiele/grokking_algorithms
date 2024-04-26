const print = @import("std").debug.print;
const expect = @import("std").testing.expect;

pub fn main() void {
    var list = [_]i32{ 1, 2, 3, 4 };
    print("{}\n", .{sum(i32, &list)});
}

fn sum(comptime T: type, list: []T) T {
    if (list.len == 0) {
        return 0;
    }
    return list[0] + sum(T, list[1..]);
}

test "sum" {
    var arr0 = [_]i32{ 1, 2, 3, 4 };
    var arr1 = [_]i32{};
    const tests = [_]struct {
        arr: []i32,
        exp: i32,
    }{
        .{
            .arr = &arr0,
            .exp = 10,
        },
        .{
            .arr = &arr1,
            .exp = 0,
        },
    };

    for (tests) |t| {
        const n = sum(@TypeOf(t.exp), t.arr);
        try expect(n == t.exp);
    }
}
