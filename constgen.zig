const std = @import("std");

fn vec_ops(size: usize, comptime Val: type) type {
    return struct {
        // fn dot(a: []const Val, b: []const Val) Val {
        fn dot(a: [size]Val, b: [size]Val) Val {
            var result: Val = 0;
            for (a) |val_a, index| {
                result += val_a * b[index];
            }
            return result;
        }

        fn norm(a: [size]Val) Val {
            return @sqrt(dot(a, a));
        }
    };
}

const vec2f64 = vec_ops(2, f64);
// export const norm2f64 = vec2f64.norm;

pub fn main() !void {
    const a = [_]f64{ 1.5, 2 };
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello, {}!\n", .{vec2f64.norm(a)});
}
