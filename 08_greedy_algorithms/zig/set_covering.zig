const std = @import("std");
const heap = std.heap;
const mem = std.mem;

pub fn main() !void {
    var gpa = heap.GeneralPurposeAllocator(.{}){};
    var arena = heap.ArenaAllocator.init(&gpa.allocator);
    defer arena.deinit();

    var states_needed_array = [_][]const u8{ "mt", "wa", "or", "id", "nv", "ut", "ca", "az" };
    var states_needed = std.BufSet.init(&arena.allocator);
    for (states_needed_array) |sn| {
        try states_needed.put(sn);
    }

    var stations = std.StringHashMap(*std.BufSet).init(&arena.allocator);

    var kone = std.BufSet.init(&arena.allocator);
    try kone.put("id");
    try kone.put("nv");
    try kone.put("ut");
    try stations.put("kone", &kone);

    var ktwo = std.BufSet.init(&arena.allocator);
    try ktwo.put("wa");
    try ktwo.put("id");
    try ktwo.put("mt");
    try stations.put("ktwo", &ktwo);

    var kthree = std.BufSet.init(&arena.allocator);
    try kthree.put("or");
    try kthree.put("nv");
    try kthree.put("ca");
    try stations.put("kthree", &kthree);

    var kfour = std.BufSet.init(&arena.allocator);
    try kfour.put("nv");
    try kfour.put("ut");
    try stations.put("kfour", &kfour);

    var kfive = std.BufSet.init(&arena.allocator);
    try kfive.put("ca");
    try kfive.put("az");
    try stations.put("kfive", &kfive);

    try setCovering(&gpa.allocator, &stations, &states_needed);
}

fn setCovering(allocator: *mem.Allocator, stations: *std.StringHashMap(*std.BufSet), states_needed: *std.BufSet) !void {
    var final_stations = std.BufSet.init(allocator);
    defer final_stations.deinit();

    while (states_needed.count() > 0) {
        var best_station: []const u8 = undefined;
        var states_covered: [][]const u8 = &[_][]const u8{};

        var it = stations.iterator();
        while (it.next()) |element| {
            var covered = &std.ArrayList([]const u8).init(allocator);
            try intersect(allocator, states_needed, element.value, covered);
            if (covered.items.len > states_covered.len) {
                best_station = element.key;
                states_covered = covered.items;
            } else covered.deinit();
        }

        difference(states_needed, states_covered);
        try final_stations.put(best_station);
    }

    var i = final_stations.iterator();
    while (i.next()) |element| {
        std.debug.print("{s}\n", .{element.key});
    }
}

fn intersect(allocator: *mem.Allocator, left: *std.BufSet, right: *std.BufSet, intersection: *std.ArrayList([]const u8)) !void {
    var l_it = left.iterator();
    var r_it = right.iterator();
    while (l_it.next()) |l_elem| {
        while (r_it.next()) |r_elem| {
            if (std.mem.eql(u8, l_elem.key, r_elem.key)) {
                try intersection.append(l_elem.key);
            }
        }
    }
}

fn difference(lessening: *std.BufSet, subtracting: [][]const u8) void {
    var less_it = lessening.iterator();

    while (less_it.next()) |less_elem| {
        for (subtracting) |sub_elem| {
            if (std.mem.eql(u8, less_elem.key, sub_elem)) {
                lessening.delete(less_elem.key);
            }
        }
    }
}
