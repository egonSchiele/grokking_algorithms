const std = @import("std");
const heap = std.heap;
const math = std.math;
const expect = std.testing.expect;

fn subsequence(a: []const u8, b: []const u8) !u32 {
    var gpa = heap.GeneralPurposeAllocator(.{}){};
    var arena = heap.ArenaAllocator.init(&gpa.allocator);
    defer arena.deinit();

    var cell = try arena.allocator.alloc([]u32, a.len + 1);

    for (cell) |*row| {
        row.* = try arena.allocator.alloc(u32, b.len + 1);
        for (row.*) |*item| {
            item.* = 0;
        }
    }

    var i: usize = 1;
    while (i <= a.len) : (i += 1) {
        var j: usize = 1;
        while (j <= b.len) : (j += 1) {
            if (a[i - 1] == b[j - 1]) {
                cell[i][j] = cell[i - 1][j - 1] + 1;
            } else {
                cell[i][j] = math.max(cell[i][j - 1], cell[i - 1][j]);
            }
        }
    }

    return cell[a.len][b.len];
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
        var n = try subsequence(t.a, t.b);
        expect(n == t.exp);
    }
}
