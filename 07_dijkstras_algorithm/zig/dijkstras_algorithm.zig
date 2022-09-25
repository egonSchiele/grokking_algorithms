const std = @import("std");
const mem = std.mem;
const heap = std.heap;

pub fn main() !void {
    var gpa = heap.GeneralPurposeAllocator(.{}){};
    var arena = heap.ArenaAllocator.init(gpa.allocator());
    defer arena.deinit();

    var graph = std.StringHashMap(*std.StringHashMap(f32)).init(arena.allocator());

    var start = std.StringHashMap(f32).init(arena.allocator());
    try start.put("a", 6);
    try start.put("b", 2);
    try graph.put("start", &start);

    var a = std.StringHashMap(f32).init(arena.allocator());
    try a.put("finish", 1);
    try graph.put("a", &a);

    var b = std.StringHashMap(f32).init(arena.allocator());
    try b.put("a", 3);
    try b.put("finish", 5);
    try graph.put("b", &b);

    var fin = std.StringHashMap(f32).init(arena.allocator());
    try graph.put("finish", &fin);

    var result = try dijkstra(arena.allocator(), &graph, "start", "finish");

    std.debug.print("Cost from the start to each node:\n", .{});
    var costs_it = result.costs.iterator();
    while (costs_it.next()) |cost| {
        std.debug.print("{s}: {d} ", .{ cost.key_ptr.*, cost.value_ptr.* });
    }
    std.debug.print("\n", .{});
    std.debug.print("\n", .{});
    std.debug.print("Path from start to finish:\n", .{});
    var path_it = result.path.iterator();
    while (path_it.next()) |parent| {
        std.debug.print("{s} = {?s}\n", .{ parent.key_ptr.*, parent.value_ptr.* });
    }
}

const dijkstraResult = struct {
    costs: std.StringHashMap(f32),
    path: std.StringHashMap(?[]const u8),
};

fn dijkstra(
    allocator: mem.Allocator,
    graph: *std.StringHashMap(*std.StringHashMap(f32)),
    start: []const u8,
    finish: []const u8,
) !dijkstraResult {
    var costs = std.StringHashMap(f32).init(allocator);
    var parents = std.StringHashMap(?[]const u8).init(allocator);
    try costs.put(finish, std.math.inf_f32);
    try parents.put(finish, null);

    var start_graph = graph.get(start);
    if (start_graph) |sg| {
        var it = sg.iterator();
        while (it.next()) |elem| {
            try costs.put(elem.key_ptr.*, elem.value_ptr.*);
            try parents.put(elem.key_ptr.*, start);
        }
    }

    var processed = std.BufSet.init(allocator);

    var n = findCheapestNode(&costs, &processed);
    while (n) |node| : (n = findCheapestNode(&costs, &processed)) {
        var cost = costs.get(node).?;
        var neighbors = graph.get(node);
        if (neighbors) |nbors| {
            var it = nbors.iterator();
            while (it.next()) |neighbor| {
                var new_cost = cost + neighbor.value_ptr.*;
                if (costs.get(neighbor.key_ptr.*).? > new_cost) {
                    try costs.put(neighbor.key_ptr.*, new_cost);
                    try parents.put(neighbor.key_ptr.*, node);
                }
            }
        }
        try processed.insert(node);
    }

    return dijkstraResult{
        .costs = costs,
        .path = parents,
    };
}

fn findCheapestNode(costs: *std.StringHashMap(f32), processed: *std.BufSet) ?[]const u8 {
    var lowest_cost = std.math.inf_f32;
    var lowest_cost_node: ?[]const u8 = null;

    var it = costs.iterator();
    while (it.next()) |node| {
        if (node.value_ptr.* < lowest_cost and !processed.contains(node.key_ptr.*)) {
            lowest_cost = node.value_ptr.*;
            lowest_cost_node = node.key_ptr.*;
        }
    }

    return lowest_cost_node;
}
