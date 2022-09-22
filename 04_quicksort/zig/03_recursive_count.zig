const print = @import("std").debug.print;
const expect = @import("std").testing.expect;

pub fn main() void {
    var arr = [_]i32{ 4, 3, 2, 1 };
    print("{}\n", .{count(i32, arr[0..])});
}

fn count(comptime T: type, arr: []T) T {
    if (arr.len == 0) {
        return 0;
    } else return 1 + count(T, arr[1..]);
}

test "count" {
    var arr0 = [_]i32{};
    var arr1 = [_]i32{42};
    var arr2 = [_]i32{ 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    var tests = [_]struct {
        arr: []i32,
        exp: i32,
    }{
        .{
            .arr = &arr0,
            .exp = 0,
        },
        .{
            .arr = &arr1,
            .exp = 1,
        },
        .{
            .arr = &arr2,
            .exp = 9,
        },
    };

    for (tests) |t| {
        try expect(count(@TypeOf(t.exp), t.arr) == t.exp);
    }
}
