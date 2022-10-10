const std = @import("std");
const heap = std.heap;
const mem = std.mem;

pub fn main() !void {
    var gpa = heap.GeneralPurposeAllocator(.{}){};
    var arena = heap.ArenaAllocator.init(gpa.allocator());
    defer arena.deinit();

    var states_needed_array = [_][]const u8{ "mt", "wa", "or", "id", "nv", "ut", "ca", "az" };
    var states_needed = std.BufSet.init(arena.allocator());
    for (states_needed_array) |sn| {
        try states_needed.insert(sn);
    }

    var stations = std.StringHashMap(*std.BufSet).init(arena.allocator());

    var kone = std.BufSet.init(arena.allocator());
    try kone.insert("id");
    try kone.insert("nv");
    try kone.insert("ut");
    try stations.put("kone", &kone);

    var ktwo = std.BufSet.init(arena.allocator());
    try ktwo.insert("wa");
    try ktwo.insert("id");
    try ktwo.insert("mt");
    try stations.put("ktwo", &ktwo);

    var kthree = std.BufSet.init(arena.allocator());
    try kthree.insert("or");
    try kthree.insert("nv");
    try kthree.insert("ca");
    try stations.put("kthree", &kthree);

    var kfour = std.BufSet.init(arena.allocator());
    try kfour.insert("nv");
    try kfour.insert("ut");
    try stations.put("kfour", &kfour);

    var kfive = std.BufSet.init(arena.allocator());
    try kfive.insert("ca");
    try kfive.insert("az");
    try stations.put("kfive", &kfive);

    try setCovering(gpa.allocator(), &stations, &states_needed);
}

fn setCovering(allocator: mem.Allocator, stations: *std.StringHashMap(*std.BufSet), states_needed: *std.BufSet) !void {
    var final_stations = std.BufSet.init(allocator);
    defer final_stations.deinit();

    while (states_needed.count() > 0) {
        var best_station: []const u8 = undefined;
        var states_covered: [][]const u8 = &[_][]const u8{};

        var it = stations.iterator();
        while (it.next()) |element| {
            var covered = &std.ArrayList([]const u8).init(allocator);
            try intersect(states_needed, element.value_ptr.*, covered);
            if (covered.items.len > states_covered.len) {
                best_station = element.key_ptr.*;
                states_covered = covered.items;
            } else covered.deinit();
        }

        difference(states_needed, states_covered);
        try final_stations.insert(best_station);
    }

    var i = final_stations.iterator();
    while (i.next()) |key| {
        std.debug.print("{s}\n", .{key.*});
    }
}

fn intersect(left: *std.BufSet, right: *std.BufSet, intersection: *std.ArrayList([]const u8)) !void {
    var l_it = left.iterator();
    var r_it = right.iterator();
    while (l_it.next()) |l_key| {
        while (r_it.next()) |r_key| {
            if (std.mem.eql(u8, l_key.*, r_key.*)) {
                try intersection.append(l_key.*);
            }
        }
    }
}

fn difference(lessening: *std.BufSet, subtracting: [][]const u8) void {
    var less_it = lessening.iterator();

    while (less_it.next()) |less_key| {
        for (subtracting) |sub_key| {
            if (std.mem.eql(u8, less_key.*, sub_key)) {
                lessening.remove(less_key.*);
            }
        }
    }
}
