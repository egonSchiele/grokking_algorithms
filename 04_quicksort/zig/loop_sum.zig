const print = @import("std").debug.print;
const expect = @import("std").testing.expect;

pub fn main() void {
    var arr = [_]i32{ 1, 2, 3, 4 };
    print("{}\n", .{sum(&arr)});
}

fn sum(arr: []i32) i32 {
    var total: i32 = 0;
    for (arr) |x| {
        total += x;
    }
    return total;
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
