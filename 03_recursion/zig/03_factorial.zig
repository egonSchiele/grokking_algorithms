const print = @import("std").debug.print;

fn fact(comptime T: type, x: T) T {
    if (x == 1) {
        return x;
    } else return x * fact(T, x - 1);
}

pub fn main() void {
    print("{}\n", .{fact(i32, 5)});
}
