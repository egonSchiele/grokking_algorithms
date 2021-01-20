const print = @import("std").debug.print;

pub fn main() void {
    greet("adit");
}

fn bye() void {
    print("ok bye!\n", .{});
}

fn greet(name: []const u8) void {
    print("hello, {s}!\n", .{name});
    greet2(name);
    print("getting ready to say bye...\n", .{});
    bye();
}

fn greet2(name: []const u8) void {
    print("how are you, {s}?\n", .{name});
}
