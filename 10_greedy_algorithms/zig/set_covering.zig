const std = @import("std");
const heap = std.heap;
const mem = std.mem;

pub fn main() !void {
    var gpa = heap.GeneralPurposeAllocator(.{}){};
    var arena = heap.ArenaAllocator.init(gpa.allocator());
    defer arena.deinit();

    const ally = arena.allocator();
    const states_needed_array = [_][]const u8{ "mt", "wa", "or", "id", "nv", "ut", "ca", "az" };
    var states_needed = std.BufSet.init(ally);
    for (states_needed_array) |sn| {
        try states_needed.insert(sn);
    }

    var stations = std.StringHashMap(*std.BufSet).init(ally);

    var k_one = std.BufSet.init(ally);
    try k_one.insert("id");
    try k_one.insert("nv");
    try k_one.insert("ut");

    var k_two = std.BufSet.init(ally);
    try k_two.insert("wa");
    try k_two.insert("id");
    try k_two.insert("mt");

    var k_three = std.BufSet.init(ally);
    try k_three.insert("or");
    try k_three.insert("nv");
    try k_three.insert("ca");

    var k_four = std.BufSet.init(ally);
    try k_four.insert("nv");
    try k_four.insert("ut");

    var k_five = std.BufSet.init(ally);
    try k_five.insert("ca");
    try k_five.insert("az");

    try stations.put("kone", &k_one);
    try stations.put("ktwo", &k_two);
    try stations.put("kthree", &k_three);
    try stations.put("kfour", &k_four);
    try stations.put("kfive", &k_five);

    const stations_covering = try setCovering(ally, &stations, &states_needed);

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
            var covered = std.ArrayList([]const u8).init(allocator);
            try intersect(states_needed, station.value_ptr.*, &covered);
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

test "setCovering" {
    var arena = heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();
    const ally = arena.allocator();

    const states_needed_array = [_][]const u8{ "mt", "wa", "or", "id", "nv", "ut", "ca", "az" };
    var states_needed = std.BufSet.init(ally);
    for (states_needed_array) |sn| {
        try states_needed.insert(sn);
    }

    var stations = std.StringHashMap(*std.BufSet).init(ally);

    var kone = std.BufSet.init(ally);
    try kone.insert("id");
    try kone.insert("nv");
    try kone.insert("ut");
    try stations.put("kone", &kone);

    var ktwo = std.BufSet.init(ally);
    try ktwo.insert("wa");
    try ktwo.insert("id");
    try ktwo.insert("mt");
    try stations.put("ktwo", &ktwo);

    var kthree = std.BufSet.init(ally);
    try kthree.insert("or");
    try kthree.insert("nv");
    try kthree.insert("ca");
    try stations.put("kthree", &kthree);

    var kfour = std.BufSet.init(ally);
    try kfour.insert("nv");
    try kfour.insert("ut");
    try stations.put("kfour", &kfour);

    var kfive = std.BufSet.init(ally);
    try kfive.insert("ca");
    try kfive.insert("az");
    try stations.put("kfive", &kfive);

    const stations_covering = try setCovering(ally, &stations, &states_needed);

    // The order of the keys in the hashmap affects the final result.
    // StringHashMap always produces the same order and we can assert over it.
    const expectedStations = &[_][]const u8{ "kfour", "ktwo", "kthree", "kfive" };
    for (stations_covering, 0..) |sc, i| {
        try std.testing.expectEqualStrings(expectedStations[i], sc);
    }
}

fn intersect(left: *std.BufSet, right: *std.BufSet, intersection: *std.ArrayList([]const u8)) !void {
    var l_it = left.iterator();
    while (l_it.next()) |l| {
        var r_it = right.iterator();
        while (r_it.next()) |r| {
            if (std.mem.eql(u8, l.*, r.*)) {
                try intersection.append(l.*);
            }
        }
    }
}

test "intersect" {
    var arena = heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();
    const ally = arena.allocator();

    var left = std.BufSet.init(ally);
    try left.insert("banana");
    try left.insert("mango");
    try left.insert("papaya");

    var right = std.BufSet.init(ally);
    try right.insert("banana");
    try right.insert("mango");
    try right.insert("avocado");

    {
        // partial intersection
        const expected = &[2][]const u8{ "banana", "mango" };
        var actual = std.ArrayList([]const u8).init(ally);

        try intersect(&left, &right, &actual);

        for (actual.items, expected) |a, e| {
            try std.testing.expectEqualStrings(e, a);
        }
    }
    {
        // full intersection
        const expected = &[3][]const u8{ "banana", "mango", "papaya" };
        var actual = std.ArrayList([]const u8).init(ally);

        try intersect(&left, &left, &actual);

        for (actual.items, expected) |a, e| {
            try std.testing.expectEqualStrings(e, a);
        }
    }
    {
        // no intersection
        var empty = std.BufSet.init(ally);
        var actual = std.ArrayList([]const u8).init(ally);

        try intersect(&left, &empty, &actual);

        try std.testing.expect(actual.items.len == 0);
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

test "difference" {
    var arena = heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();
    const ally = arena.allocator();

    {
        // partial diff
        var less = std.BufSet.init(ally);
        try less.insert("banana");
        try less.insert("mango");
        try less.insert("papaya");

        var sub = [_][]const u8{ "banana", "mango" };

        difference(&less, &sub);

        try std.testing.expect(less.count() == 1);
        try std.testing.expect(less.contains("papaya"));
    }
    {
        // full diff
        var less = std.BufSet.init(ally);
        try less.insert("banana");
        try less.insert("mango");
        try less.insert("papaya");

        var sub = [_][]const u8{ "avocado", "kiwi", "ananas" };

        difference(&less, &sub);

        try std.testing.expect(less.count() == 3);
        try std.testing.expect(less.contains("banana"));
        try std.testing.expect(less.contains("mango"));
        try std.testing.expect(less.contains("papaya"));
    }
    {
        // no diff
        var less = std.BufSet.init(ally);
        try less.insert("banana");
        try less.insert("mango");
        try less.insert("papaya");

        var sub = [_][]const u8{ "mango", "papaya", "banana" };

        difference(&less, &sub);

        try std.testing.expect(less.count() == 0);
    }
}
