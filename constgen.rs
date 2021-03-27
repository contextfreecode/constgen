use num_traits::Float;

fn dot<Val, const SIZE: usize>(a: &[Val; SIZE], b: &[Val; SIZE]) -> Val
where
    Val: Float,
{
    a.iter()
        .zip(b)
        .map(|(x, y)| *x * *y)
        .fold(Val::zero(), |sum, xy| sum + xy)
}

fn norm<Val: Float, const SIZE: usize>(a: &[Val; SIZE]) -> Val {
    dot(a, a).sqrt()
}

fn main() {
    let a = [1.5, 2.0];
    println!("norm: {}", norm(&a));
}
