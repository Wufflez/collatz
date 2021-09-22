const std = @import("std");
usingnamespace std.heap;

// Function that to return collatz conjecture in a list, using provided allocator.
fn collatz(x: usize, allocator: *std.mem.Allocator) !std.ArrayList(usize) {
    var list = std.ArrayList(usize).init(allocator);
    try list.append(x);
    var num = x;
    while (num > 1) {
        num = if (num % 2 == 1) num * 3 + 1 else num / 2;
        try list.append(num);
    }
    return list;
}

pub fn main() !void {
    // Use arena for all memory allocations.
    var arena = ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();

    var args = std.process.args();
    const stdout = std.io.getStdOut().writer();
    const stdin = std.io.getStdIn().reader();

    _ = args.skip(); // Skip exe name.

    // Parse input from first argument, or from stdin if no arg.
    var input_str: []u8 = undefined;
    if (args.next(&arena.allocator)) |arg| {
        input_str = try arg;
    } else {
        try stdout.writeAll("Please enter the input value: ");
        input_str = try stdin.readUntilDelimiterAlloc(&arena.allocator, '\n', 256);

        if(input_str[input_str.len-1] == '\r') { // If windows, might have a carriage return
            input_str = input_str[0..input_str.len-1];
        }
    }
    var input = std.fmt.parseInt(usize, input_str, 10) catch {
        try stdout.writeAll("Invalid input!\n");
        return;
    };
    var list = try collatz(input, &arena.allocator);
    try stdout.print("Collatz : {any}\n", .{list.items});
}
