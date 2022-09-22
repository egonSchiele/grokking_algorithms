const print = @import("std").debug.print;

fn countdown(comptime T: type, i: T) void {
    print("{} ", .{i});
    if (i <= 0) {
        print("\n", .{});
        return;
    } else countdown(T, i - 1);
}

pub fn main() void {
    countdown(u32, 5);
}
