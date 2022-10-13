const std = @import("std");
const heap = std.heap;
const math = std.math;
const expect = std.testing.expect;

pub fn main() !void {
    var gpa = heap.GeneralPurposeAllocator(.{}){};
    var arena = heap.ArenaAllocator.init(gpa.allocator());
    defer arena.deinit();

    var n = try subsequence(arena.allocator(), "fish", "fosh");
    std.debug.print("{d}\n", .{n});
}

fn subsequence(allocator: std.mem.Allocator, a: []const u8, b: []const u8) !u32 {
    var grid = try allocator.alloc([]u32, a.len + 1);

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
            } else {
                grid[i][j] = math.max(grid[i][j - 1], grid[i - 1][j]);
            }
        }
    }

    return grid[a.len][b.len];
}

test "subsequence" {
    var tests = [_]struct {
        a: []const u8,
        b: []const u8,
        exp: u32,
    }{
        .{ .a = "abc", .b = "abcd", .exp = 3 },
        .{ .a = "pera", .b = "mela", .exp = 2 },
        .{ .a = "banana", .b = "kiwi", .exp = 0 },
    };

    for (tests) |t| {
        var gpa = heap.GeneralPurposeAllocator(.{}){};
        var arena = heap.ArenaAllocator.init(gpa.allocator());
        defer {
            arena.deinit();
            const leaked = gpa.deinit();
            if (leaked) std.testing.expect(false) catch @panic("TEST FAIL"); //fail test; can't try in defer as defer is executed after we return
        }

        var n = try subsequence(arena.allocator(), t.a, t.b);
        try expect(n == t.exp);
    }
}
