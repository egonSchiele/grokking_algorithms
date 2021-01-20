const std = @import("std");
const mem = std.mem;
const heap = std.heap;

pub fn main() !void {
    var gpa = heap.GeneralPurposeAllocator(.{}){};
    var arena = heap.ArenaAllocator.init(&gpa.allocator);
    defer arena.deinit();

    var graph = std.StringHashMap(*std.StringHashMap(f32)).init(&arena.allocator);

    var start = std.StringHashMap(f32).init(&arena.allocator);
    try start.put("a", 6);
    try start.put("b", 6);
    try graph.put("start", &start);

    var a = std.StringHashMap(f32).init(&arena.allocator);
    try a.put("fin", 1);
    try graph.put("a", &a);

    var b = std.StringHashMap(f32).init(&arena.allocator);
    try b.put("a", 3);
    try b.put("fin", 5);
    try graph.put("b", &b);

    var fin = std.StringHashMap(f32).init(&arena.allocator);
    try graph.put("fin", &fin);

    var costs = std.StringHashMap(f32).init(&arena.allocator);
    try costs.put("a", 6);
    try costs.put("b", 2);
    try costs.put("fin", std.math.inf(f32));

    var parents = std.StringHashMap(?[]const u8).init(&arena.allocator);
    try parents.put("a", "start");
    try parents.put("b", "start");
    try parents.put("fin", null);

    try dijkstra(&gpa.allocator, &graph, &costs, &parents);
}

fn dijkstra(
    allocator: *mem.Allocator,
    graph: *std.StringHashMap(*std.StringHashMap(f32)),
    costs: *std.StringHashMap(f32),
    parents: *std.StringHashMap(?[]const u8),
) !void {
    var processed = std.BufSet.init(allocator);
    defer processed.deinit();

    var n = findCheapestNode(costs, &processed);
    while (n) |node| : (n = findCheapestNode(costs, &processed)) {
        var cost = costs.get(node).?;
        var neighbors = graph.get(node);
        if (neighbors) |nbors| {
            var it = nbors.iterator();
            while (it.next()) |element| {
                var new_cost = cost + element.value;
                if (costs.get(element.key).? > new_cost) {
                    try costs.put(element.key, new_cost);
                    try parents.put(element.key, node);
                }
            }
            try processed.put(node);
        }
    }

    std.debug.print("Cost from the start to each node:\n", .{});
    var i = costs.iterator();
    while (i.next()) |cost| {
        std.debug.print("{s} = {d}\n", .{ cost.key, cost.value });
    }
}

fn findCheapestNode(costs: *std.StringHashMap(f32), processed: *std.BufSet) ?[]const u8 {
    var lowest_cost = std.math.inf(f32);
    var lowest_cost_node: ?[]const u8 = null;

    var it = costs.iterator();
    while (it.next()) |node| {
        if (node.value < lowest_cost and !processed.exists(node.key)) {
            lowest_cost = node.value;
            lowest_cost_node = node.key;
        }
    }

    return lowest_cost_node;
}
