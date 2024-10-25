const std = @import("std");
const heap = std.heap;
const math = std.math;
const expect = std.testing.expect;
const expectEqualStrings = std.testing.expectEqualStrings;

pub fn main() !void {
    var gpa = heap.GeneralPurposeAllocator(.{}){};
    var arena = heap.ArenaAllocator.init(gpa.allocator());
    defer arena.deinit();

    const n, const sub = try subsequence(arena.allocator(), "fish", "fosh");
    std.debug.print("{d}: {s}\n", .{ n, sub });
}

fn subsequence(allocator: std.mem.Allocator, a: []const u8, b: []const u8) !struct { u32, []const u8 } {
    var grid = try allocator.alloc([]u32, a.len + 1);
    var subseq = try std.ArrayList(u8).initCapacity(allocator, @max(a.len, b.len));

    for (grid) |*row| {
        row.* = try allocator.alloc(u32, b.len + 1);
        for (row.*) |*cell| {
            cell.* = 0;
        }
    }

    var i: usize = 1;
    while (i <= a.len) : (i += 1) {
        var j: usize = 1;
        while (j <= b.len) : (j += 1) {
            if (a[i - 1] == b[j - 1]) {
                grid[i][j] = grid[i - 1][j - 1] + 1;
                try subseq.append(a[i - 1]);
            } else {
                grid[i][j] = @max(grid[i][j - 1], grid[i - 1][j]);
            }
        }
    }

    const sub = try subseq.toOwnedSlice();
    return .{ grid[a.len][b.len], sub };
}

test "subsequence" {
    const tests = [_]struct {
        a: []const u8,
        b: []const u8,
        expected: struct { u32, []const u8 },
    }{
        .{ .a = "abc", .b = "abcd", .expected = .{ 3, "abc" } },
        .{ .a = "pera", .b = "mela", .expected = .{ 2, "ea" } },
        .{ .a = "banana", .b = "kiwi", .expected = .{ 0, "" } },
    };

    for (tests) |t| {
        var arena = heap.ArenaAllocator.init(std.testing.allocator);
        defer arena.deinit();

        const actual = try subsequence(arena.allocator(), t.a, t.b);

        try std.testing.expectEqualDeep(t.expected, actual);
    }
}
