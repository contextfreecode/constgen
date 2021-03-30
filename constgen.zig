fn vecOps(size: usize, comptime Val: type) type {
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

const vec2f32 = vecOps(2, f32);

// export const norm2f32 = vec2f32.norm;

pub fn main() void {
    const std = @import("std");
    const a = [_]f32{ 1.5, 2 };
    std.debug.print("norm: {}\n", .{vec2f32.norm(a)});
}





// export fn norm2f32(a: *[2]f32) callconv(.C) f32 {
//     return vec2f32.norm(a.*);
// }
// export fn norm2f32(x: f32, y: f32) callconv(.C) f32 {
//     return vec2f32.norm([_]f32{x, y});
// }
