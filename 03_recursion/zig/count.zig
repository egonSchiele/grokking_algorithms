const print = @import("std").debug.print;
const expect = @import("std").testing.expect;

pub fn main() void {
    var arr = [_]i32{ 4, 3, 2, 1 };
    print("{}\n", .{count(arr[0..])});
}

fn count(arr: []i32) i32 {
    if (arr.len == 0) {
        return 0;
    } else return 1 + count(arr[1..]);
}

test "count" {
    var arr0 = [_]i32{};
    var arr1 = [_]i32{42};
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
    };

    for (tests) |t| {
        expect(count(t.arr) == t.exp);
    }
}
