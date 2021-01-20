const print = @import("std").debug.print;
const expect = @import("std").testing.expect;

pub fn main() void {
    var list = [_]i32{ 1, 2, 3, 4 };
    print("{}\n", .{sum(&list)});
}

fn sum(list: []i32) i32 {
    if (list.len == 0) {
        return 0;
    }
    return list[0] + sum(list[1..]);
}

test "sum" {
    var arr0 = [_]i32{ 1, 2, 3, 4 };
    var arr1 = [_]i32{};
    var tests = [_]struct {
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
        var n = sum(t.arr);
        expect(n == t.exp);
    }
}
