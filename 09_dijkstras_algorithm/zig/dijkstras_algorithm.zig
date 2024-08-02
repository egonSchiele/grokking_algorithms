const std = @import("std");
const mem = std.mem;
const heap = std.heap;

pub fn main() !void {
    var gpa = heap.GeneralPurposeAllocator(.{}){};
    var arena = heap.ArenaAllocator.init(gpa.allocator());
    defer arena.deinit();
    const alloc = arena.allocator();

    var graph = std.StringHashMap(*std.StringHashMap(f32)).init(alloc);

    var start = std.StringHashMap(f32).init(alloc);
    try start.put("a", 6);
    try start.put("b", 2);
    try start.put("c", 42);
    try graph.put("start", &start);

    var a = std.StringHashMap(f32).init(alloc);
    try a.put("finish", 1);
    try graph.put("a", &a);

    var b = std.StringHashMap(f32).init(alloc);
    try b.put("a", 3);
    try b.put("finish", 5);
    try graph.put("b", &b);

    var c = std.StringHashMap(f32).init(alloc);
    try c.put("finish", 42);
    try graph.put("c", &c);

    var fin = std.StringHashMap(f32).init(alloc);
    try graph.put("finish", &fin);

    var costs, var path = try dijkstra(alloc, &graph, "start", "finish");

    // Traverse the path hashmap backwards from finish to start and store the
    // steps in an ordered list.
    // The hashmap is unordered so there is no guarantee to print the path in
    // the correct order only by iterating through key/value(s).
    var dir = std.ArrayList([]const u8).init(alloc);

    var v: []const u8 = "finish";
    try dir.append(v);
    var node = path.get(v);
    while (node) |n| : (node = path.get(v)) {
        try dir.append(n.?);
        v = n.?;
    }
    std.debug.print("Path from start to finish:\n", .{});
    std.debug.print("start =(", .{});
    var i = dir.items.len - 2;
    var prev_cost: f32 = 0;
    while (i > 0) : (i -= 1) {
        const d = dir.items[i];
        const cost = costs.get(d).?;
        std.debug.print("{d})=> {s:<6}: {d}\n{s:<5} =(", .{ cost - prev_cost, d, cost, d });
        prev_cost = cost;
    }
    const fin_cost = costs.get("finish").?;
    std.debug.print("{d})=> finish: {d}\n", .{ fin_cost - prev_cost, fin_cost });
}

/// applies the dijkstra algorithm on graph using start and finish nodes.
/// Returns a tuple with the costs and the path.
fn dijkstra(
    allocator: mem.Allocator,
    graph: *std.StringHashMap(*std.StringHashMap(f32)),
    start: []const u8,
    finish: []const u8,
) !struct {
    std.StringHashMap(f32), // costs
    std.StringHashMap(?[]const u8), // path
} {
    var costs = std.StringHashMap(f32).init(allocator);
    var parents = std.StringHashMap(?[]const u8).init(allocator);
    try costs.put(finish, std.math.inf(f32));
    try parents.put(finish, null);

    // initialize costs and parents maps for the nodes having start as parent
    const start_graph = graph.get(start) orelse return error.MissingNode;
    var sg_it = start_graph.iterator();
    while (sg_it.next()) |elem| {
        try parents.put(elem.key_ptr.*, start);
        try costs.put(elem.key_ptr.*, elem.value_ptr.*);
    }

    var processed = std.BufSet.init(allocator);

    var n = findCheapestNode(&costs, &processed);
    while (n) |node| : (n = findCheapestNode(&costs, &processed)) {
        const cost = costs.get(node).?;
        const neighbors = graph.get(node) orelse return error.MissingNode;
        var it = neighbors.iterator();
        while (it.next()) |neighbor| {
            const new_cost = cost + neighbor.value_ptr.*;
            if (costs.get(neighbor.key_ptr.*).? > new_cost) {
                // update maps if we found a cheaper path
                try costs.put(neighbor.key_ptr.*, new_cost);
                try parents.put(neighbor.key_ptr.*, node);
            }
        }
        try processed.insert(node);
    }

    return .{ costs, parents };
}

/// finds the cheapest node among the not yet processed ones.
fn findCheapestNode(costs: *std.StringHashMap(f32), processed: *std.BufSet) ?[]const u8 {
    var lowest_cost = std.math.inf(f32);
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

test "dijkstra" {
    var gpa = heap.GeneralPurposeAllocator(.{}){};
    var arena = heap.ArenaAllocator.init(gpa.allocator());
    defer {
        arena.deinit();
        const check = gpa.deinit();
        if (check == .leak) std.testing.expect(false) catch @panic("TEST FAIL"); //fail test; can't try in defer as defer is executed after we return
    }
    const alloc = arena.allocator();

    var graph = std.StringHashMap(*std.StringHashMap(f32)).init(alloc);

    var start = std.StringHashMap(f32).init(alloc);
    try start.put("a", 6);
    try start.put("b", 2);
    try graph.put("start", &start);

    var a = std.StringHashMap(f32).init(alloc);
    try a.put("finish", 1);
    try graph.put("a", &a);

    var b = std.StringHashMap(f32).init(alloc);
    try b.put("a", 3);
    try b.put("finish", 5);
    try graph.put("b", &b);

    var fin = std.StringHashMap(f32).init(alloc);
    try graph.put("finish", &fin);

    var costs, var path = try dijkstra(alloc, &graph, "start", "finish");

    try std.testing.expectEqual(costs.get("a").?, 5);
    try std.testing.expectEqual(costs.get("b").?, 2);
    try std.testing.expectEqual(costs.get("finish").?, 6);
    try std.testing.expectEqual(path.get("b").?, "start");
    try std.testing.expectEqual(path.get("a").?, "b");
    try std.testing.expectEqual(path.get("finish").?, "a");
}
