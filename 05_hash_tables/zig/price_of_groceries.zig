const std = @import("std");
const heap = std.heap;

pub fn main() !void {
    var gpa = heap.GeneralPurposeAllocator(.{}){};

    var map = std.StringHashMap(f32).init(&gpa.allocator);
    defer map.deinit();

    try map.put("apple", 0.67);
    try map.put("milk", 1.49);
    try map.put("avocado", 1.49);

    var iterator = map.iterator();

    while (iterator.next()) |entry| {
        std.debug.print("{s}: {d:.2}\n", .{ entry.key, entry.value });
    }
}
