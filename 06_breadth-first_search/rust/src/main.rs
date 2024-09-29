use std::collections::{HashMap, VecDeque};
use std::fmt;

#[derive(Eq, Hash, PartialEq)]
struct Person(String);

impl Person {
    fn is_seller(&self) -> bool {
        self.0.ends_with('m')
    }
}

impl fmt::Display for Person {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        f.write_str(&self.0)
    }
}

fn search(graph: &HashMap<&Person, Vec<&Person>>, start: &Person) {
    let mut search_queue = VecDeque::new();
    search_queue.push_back(start);

    let mut searched: Vec<&Person> = Vec::with_capacity(graph.len());
    loop {
        match search_queue.pop_front() {
            Some(person) => {
                if !searched.contains(&person) {
                    if person.is_seller() {
                        println!("{} is a mango seller!", person);
                        break;
                    } else {
                        for p in graph.get(&person).unwrap() {
                            search_queue.push_back(p);
                            searched.push(person);
                        }
                    }
                }
            }
            None => {
                println!("no mango seller found!");
                break;
            }
        }
    }
}

fn main() {
    let you = Person("you".to_string());
    let alice = Person("alice".to_string());
    let bob = Person("bob".to_string());
    let claire = Person("claire".to_string());
    let anuj = Person("anuj".to_string());
    let peggy = Person("peggy".to_string());
    let thom = Person("thom".to_string());
    let jonny = Person("jonny".to_string());

    let mut graph = HashMap::new();
    graph.insert(&you, vec![&alice, &bob, &claire]);
    graph.insert(&bob, vec![&anuj, &peggy]);
    graph.insert(&alice, vec![&peggy]);
    graph.insert(&claire, vec![&thom, &jonny]);
    graph.insert(&anuj, vec![]);
    graph.insert(&peggy, vec![]);
    graph.insert(&thom, vec![]);
    graph.insert(&jonny, vec![]);

    search(&graph, &you);
}
