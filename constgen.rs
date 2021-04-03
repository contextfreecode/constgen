use num_traits::Float;
use std::{array::IntoIter};  //, mem::size_of};

fn dot<Val: Float, const SIZE: usize>(
    a: [Val; SIZE],
    b: [Val; SIZE],
) -> Val {
    // a.iter()
    //     .zip(b)
    //     .map(|(x, y)| *x * *y)
    //     .fold(Val::zero(), |sum, xy| sum + xy)
    IntoIter::new(a)
        .zip(IntoIter::new(b))
        .map(|(x, y)| x * y)
        .fold(Val::zero(), |sum, xy| sum + xy)
}

fn norm<Val: Float, const SIZE: usize>(a: [Val; SIZE]) -> Val {
    dot(a, a).sqrt()
}

// pub fn norm2(x: f32, y: f32) -> f32 {
//     return norm([x, y]);
// }

fn main() {
    let a = [1.5, 2.0f32];
    println!("norm: {}", norm::<f32, 2>(a));
    // println!("sizes: {} {}", size_of::<[f32; 2]>(), size_of::<&[f32]>());
}

// -C opt-level=3

// use std::ops::*;

// trait Float: Copy + Sized + Add<Self, Output = Self> + Mul<Self, Output = Self> {
//     fn sqrt(self) -> Self;

//     fn zero() -> Self;
// }

// impl Float for f32 {
//     fn sqrt(self) -> f32 {
//         self.sqrt()
//     }

//     fn zero() -> f32 {
//         0f32
//     }
// }
