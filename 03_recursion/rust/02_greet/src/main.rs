fn greet2(name: &str) {
    println!("how are you {}?", name);
}

fn bye() {
    println!("ok bye!");
}

fn greet(name: &str) {
    println!("hello {}!", name);
    greet2(name);
    println!("getting ready to say bye...");
    bye();
}
  
fn main() {
    greet("adit");
}
