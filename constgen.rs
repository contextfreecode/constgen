use num_traits::Float;
use std::array::IntoIter;

fn dot<Val, const SIZE: usize>(a: [Val; SIZE], b: [Val; SIZE]) -> Val
where
    Val: Float,
{
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
    let a = [1.5, 2.0];
    println!("norm: {}", norm(a));
    // println!("norm: {}", norm(a));
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
