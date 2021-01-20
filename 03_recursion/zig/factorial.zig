const print = @import("std").debug.print;

fn fact(x: i32) i32 {
    if (x == 1) {
        return x;
    } else return x * fact(x - 1);
}

pub fn main() void {
    print("{}\n", .{fact(5)});
}
