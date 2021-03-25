const std = @import("std");

pub fn main() !void {
    const a = [_]f64{ 1.5, 2 };
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello, {}!\n", .{"world"});
}
