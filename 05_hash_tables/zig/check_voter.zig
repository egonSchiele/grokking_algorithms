const std = @import("std");
const heap = std.heap;

pub fn main() !void {
    var gpa = heap.GeneralPurposeAllocator(.{}){};

    var map = std.StringHashMap(void).init(gpa.allocator());
    defer map.deinit();

    try checkVoter(&map, "tom");
    try checkVoter(&map, "mike");
    try checkVoter(&map, "mike");
}

fn checkVoter(voted: *std.StringHashMap(void), name: []const u8) !void {
    if (voted.contains(name)) {
        std.debug.print("kick them out!\n", .{});
    } else {
        try voted.put(name, {});
        std.debug.print("let them vote!\n", .{});
    }
}
