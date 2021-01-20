const print = @import("std").debug.print;
const expect = @import("std").testing.expect;

pub fn main() void {
    var list = [_]i32{ 1, 2, 3, 4 };
    print("{}\n", .{count(&list)});
}

fn count(list: []i32) i32 {
    if (list.len == 0) {
        return 0;
    }
    return 1 + count(list[1..]);
}

test "count" {
    var arr0 = [_]i32{ 1, 2, 3, 4 };
    var arr1 = [_]i32{};
    var tests = [_]struct {
        arr: []i32,
        exp: i32,
    }{
        .{
            .arr = &arr0,
            .exp = 4,
        },
        .{
            .arr = &arr1,
            .exp = 0,
        },
    };

    for (tests) |t| {
        var n = count(t.arr);
        expect(n == t.exp);
    }
}
