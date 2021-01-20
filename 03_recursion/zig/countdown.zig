const print = @import("std").debug.print;

fn countdown(i: i32) void {
    print("{} ", .{i});
    if (i <= 0) {
        print("\n", .{});
        return;
    } else countdown(i - 1);
}

pub fn main() void {
    countdown(5);
}
