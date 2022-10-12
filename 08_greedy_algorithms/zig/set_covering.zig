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

    var stations_covering = try setCovering(arena.allocator(), &stations, &states_needed);

    for (stations_covering) |sc| {
        std.debug.print("{s}\n", .{sc});
    }
}

fn setCovering(allocator: mem.Allocator, stations: *std.StringHashMap(*std.BufSet), states_needed: *std.BufSet) ![][]const u8 {
    var final_stations = std.BufSet.init(allocator);

    while (states_needed.count() > 0) {
        var best_station: []const u8 = undefined;
        var states_covered: [][]const u8 = &[_][]const u8{};

        var it = stations.iterator();
        while (it.next()) |station| {
            var covered = &std.ArrayList([]const u8).init(allocator);
            try intersect(states_needed, station.value_ptr.*, covered);
            if (covered.items.len > states_covered.len) {
                best_station = station.key_ptr.*;
                states_covered = covered.items;
            } else covered.deinit();
        }

        difference(states_needed, states_covered);
        try final_stations.insert(best_station);
    }

    var final_array = std.ArrayList([]const u8).init(allocator);
    var i = final_stations.iterator();
    while (i.next()) |key| {
        try final_array.append(key.*);
    }

    return final_array.toOwnedSlice();
}

fn intersect(left: *std.BufSet, right: *std.BufSet, intersection: *std.ArrayList([]const u8)) !void {
    var l_it = left.iterator();
    var r_it = right.iterator();
    while (l_it.next()) |l| {
        while (r_it.next()) |r| {
            if (std.mem.eql(u8, l.*, r.*)) {
                try intersection.append(l.*);
            }
        }
    }
}

fn difference(lessening: *std.BufSet, subtracting: [][]const u8) void {
    var less_it = lessening.iterator();

    while (less_it.next()) |less| {
        for (subtracting) |sub| {
            if (std.mem.eql(u8, less.*, sub)) {
                lessening.remove(less.*);
            }
        }
    }
}

test "setCovering" {
    var gpa = heap.GeneralPurposeAllocator(.{}){};
    var arena = heap.ArenaAllocator.init(gpa.allocator());
    defer {
        arena.deinit();
        const leaked = gpa.deinit();
        if (leaked) std.testing.expect(false) catch @panic("TEST FAIL"); //fail test; can't try in defer as defer is executed after we return
    }

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

    var stations_covering = try setCovering(arena.allocator(), &stations, &states_needed);

    var expectedStations = &[_][]const u8{ "kone", "ktwo", "kfive", "kthree" };
    for (stations_covering) |sc, i| {
        try std.testing.expectEqualStrings(expectedStations[i], sc);
    }
}
