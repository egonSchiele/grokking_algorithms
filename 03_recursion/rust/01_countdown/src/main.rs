use std::ops::Sub;
use std::fmt::Display;
use num_traits::identities::One;
use num_traits::identities::Zero;

fn countdown<T: Display + One + Zero + Sub<Output = T>>(i: T) {
    println!("{}", i);
    if i.is_zero() {
        return
    }

   countdown(i - T::one());
}

fn main() {
    countdown(5);
}
