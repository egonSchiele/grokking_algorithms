const std = @import("std");
const mem = std.mem;
const heap = std.heap;

pub fn main() !void {
    var gpa = heap.GeneralPurposeAllocator(.{}){};

    var graph = std.StringHashMap([][]const u8).init(gpa.allocator());
    defer graph.deinit();

    var you = [_][]const u8{ "alice", "bob", "claire" };
    var bob = [_][]const u8{ "anuj", "peggy" };
    var alice = [_][]const u8{"peggy"};
    var claire = [_][]const u8{ "thom", "jonny" };
    var anuj = [_][]const u8{};
    var peggy = [_][]const u8{};
    var thom = [_][]const u8{};
    var jonny = [_][]const u8{};

    try graph.put("you", &you);
    try graph.put("bob", &bob);
    try graph.put("alice", &alice);
    try graph.put("claire", &claire);
    try graph.put("anuj", &anuj);
    try graph.put("peggy", &peggy);
    try graph.put("thom", &thom);
    try graph.put("jonny", &jonny);

    try search(gpa.allocator(), &graph, "you");
}

fn search(
    allocator: mem.Allocator,
    graph: *std.StringHashMap([][]const u8),
    name: []const u8,
) !void {
    var arena = heap.ArenaAllocator.init(allocator);
    defer arena.deinit();
    var searched = std.BufSet.init(arena.allocator());
    const Q = std.TailQueue([]const u8);
    var queue = Q{};

    var name_edges = graph.get(name);
    if (name_edges) |edges| {
        var nodes = try arena.allocator().alloc(Q.Node, edges.len);
        var i: usize = 0;
        while (i < edges.len) : (i += 1) {
            nodes[i].data = edges[i];
        }
        for (nodes) |*node| {
            queue.append(node);
        }
    }

    while (queue.len > 0) {
        var first = queue.popFirst();
        if (first) |person| {
            if (!searched.contains(person.data)) {
                if (personIsSeller(person.data)) {
                    std.debug.print("{s} is a mango seller!\n", .{person.data});
                    return;
                } else {
                    var ee = graph.get(person.data);
                    if (ee) |edges| {
                        var nodes = try arena.allocator().alloc(Q.Node, edges.len);
                        var i: usize = 0;
                        while (i < edges.len) : (i += 1) {
                            nodes[i].data = edges[i];
                        }
                        for (nodes) |*node| {
                            queue.append(node);
                        }
                    }
                    try searched.insert(person.data);
                }
            }
        }
    }
}

fn personIsSeller(name: []const u8) bool {
    return name[name.len - 1] == 'm';
}

test "search" {
    var gpa = heap.GeneralPurposeAllocator(.{}){};

    var graph = std.StringHashMap([][]const u8).init(gpa.allocator());
    defer {
        graph.deinit();
        const leaked = gpa.deinit();
        if (leaked) std.testing.expect(false) catch @panic("TEST FAIL"); //fail test; can't try in defer as defer is executed after we return
    }

    var you = [_][]const u8{ "alice", "bob", "claire" };
    var bob = [_][]const u8{ "anuj", "peggy" };
    var alice = [_][]const u8{"peggy"};
    var claire = [_][]const u8{ "thom", "jonny" };
    var anuj = [_][]const u8{};
    var peggy = [_][]const u8{};
    var thom = [_][]const u8{};
    var jonny = [_][]const u8{};

    try graph.put("you", &you);
    try graph.put("bob", &bob);
    try graph.put("alice", &alice);
    try graph.put("claire", &claire);
    try graph.put("anuj", &anuj);
    try graph.put("peggy", &peggy);
    try graph.put("thom", &thom);
    try graph.put("jonny", &jonny);

    try search(gpa.allocator(), &graph, "you");
}
