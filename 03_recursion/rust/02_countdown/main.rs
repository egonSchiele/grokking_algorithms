// Rust has three kinds of loops: loop, while, and for. Let’s try each one + recursive.
fn main() {
    countdown_loop(5);
    println!("------");

    countdown_while(5);
    println!("------");

    countdown_for(5);
    println!("------");

    countdown_recursive(5);
}


fn countdown_loop(count: usize) {
    let mut i = count;

    loop {
        println!("{}", i);
        i -= 1;

        if i <= 0 {
            break;
        }
    }
}

fn countdown_while(count: usize) {
    let mut i = count;

    while i > 0 {
        println!("{}", i);

        i -= 1;
    }
}


fn countdown_for(count: usize) {
    for i in (1..count + 1).rev() {
        println!("{}", i);
    }
}

fn countdown_recursive(count: usize) {
    println!("{}", count);

    if count > 1 {
        return countdown_recursive(count - 1);
    }
}
