const std = @import("std");

fn dot(a: []const f64, b: []const f64) f64 {
    var result: f64 = 0;
    for (a) |val_a, index| {
        result += val_a * b[index];
    }
    return result;
}

pub fn main() !void {
    const a = [_]f64{ 1.5, 2 };
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello, {}!\n", .{dot(&a, &a)});
}
