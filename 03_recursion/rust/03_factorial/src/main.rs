use std::ops::Sub;
use std::fmt::Display;
use num_traits::identities::One;

fn fact<T: PartialOrd + PartialEq + One + Sub<Output = T> + Copy + Display>(x: T) -> T {
    if x < T::one() {
        panic!("Invalid number: {}", x);
    } else if x.is_one() {
        return T::one();
    }

    return x * fact(x - T::one());
}

fn main() {
    println!("{}", fact(3));
}