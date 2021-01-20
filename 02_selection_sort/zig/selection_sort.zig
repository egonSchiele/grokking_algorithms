const std = @import("std");
const print = std.debug.print;
const expect = std.testing.expect;
const heap = std.heap;
const mem = std.mem;

pub fn main() !void {
    var gpa = heap.GeneralPurposeAllocator(.{}){};
    var arena = heap.ArenaAllocator.init(&gpa.allocator);
    defer arena.deinit();

    var s = [_]i32{ 5, 3, 6, 2, 10 };

    print("{d}\n", .{try selectionSort(&arena.allocator, &s)});
}

fn selectionSort(allocator: *mem.Allocator, s: []i32) ![]i32 {
    var new_arr = try allocator.alloc(i32, s.len);
    var stack = std.ArrayList(i32).init(allocator);
    try stack.appendSlice(s);
    var i: usize = 0;

    while (i < s.len) : (i += 1) {
        const smallest: usize = findSmallest(stack.items);
        new_arr[i] = stack.items[smallest];
        _ = stack.swapRemove(smallest);
    }

    return new_arr[0..];
}

// returns the index of the smallest number
fn findSmallest(arr: []i32) usize {
    var smallest = arr[0];
    var smallest_index: usize = 0;
    var i: usize = 1;

    while (i < arr.len) : (i += 1) {
        if (arr[i] < smallest) {
            smallest = arr[i];
            smallest_index = i;
        }
    }

    return smallest_index;
}

test "findSmallest" {
    var s = [_]i32{ 5, 3, 6, 2, 10 };

    expect(findSmallest(&s) == 3); // index of 2
}

test "selectionSort" {
    var gpa = heap.GeneralPurposeAllocator(.{}){};
    var arena = heap.ArenaAllocator.init(&gpa.allocator);
    defer arena.deinit();
    var s = [_]i32{ 5, 3, 6, 2, 10 };
    var exp = [_]i32{ 2, 3, 5, 6, 10 };

    var res = try selectionSort(&arena.allocator, &s);

    expect(res.len == exp.len);
    for (res) |e, i|
        expect(e == exp[i]);
}
