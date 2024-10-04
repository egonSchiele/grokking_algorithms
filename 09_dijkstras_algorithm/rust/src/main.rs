use std::{collections::HashMap, u64};

fn find_lowest_cost_node(processed: &Vec<String>, costs: &HashMap<String, u64>) -> Option<String> {
    let mut lowest_cost = u64::MAX;
    let mut lowest_cost_node = None;
    for (node, cost) in costs.iter() {
        if *cost < lowest_cost && !processed.contains(node) {
            lowest_cost = *cost;
            lowest_cost_node = Some(node);
        }
    }
    return lowest_cost_node.cloned();
}

fn main() {
    // Graph Setup
    let mut graph = HashMap::new();

    let mut start_edges: HashMap<String, u64> = HashMap::new();
    start_edges.insert("a".to_string(), 6);
    start_edges.insert("b".to_string(), 2);
    graph.insert("start".to_string(), start_edges);

    let mut a_edges = HashMap::new();
    a_edges.insert("fin".to_string(), 1);
    graph.insert("a".to_string(), a_edges);

    let mut b_edges = HashMap::new();
    b_edges.insert("a".to_string(), 3);
    b_edges.insert("fin".to_string(), 5);
    graph.insert("b".to_string(), b_edges);

    let fin_edges = HashMap::new();
    graph.insert("fin".to_string(), fin_edges);

    // Costs Setup
    let mut costs: HashMap<String, u64> = HashMap::new();
    costs.insert("a".to_string(), 6);
    costs.insert("b".to_string(), 2);
    costs.insert("fin".to_string(), u64::MAX);

    // Parents Setup
    let mut parents = HashMap::new();
    parents.insert("a".to_string(), Some("start".to_string()));
    parents.insert("b".to_string(), Some("start".to_string()));
    parents.insert("fin".to_string(), None);

    let mut processed: Vec<String> = vec![];

    loop {
        let node = find_lowest_cost_node(&processed, &costs);
        match node {
            Some(node) => {
                let cost = *costs.get(&node).unwrap();
                let neighbors = graph.get(&node).unwrap();
                for (n, ncost) in neighbors.iter() {
                    let new_cost = cost + *ncost;
                    if *costs.get(n).unwrap() > new_cost {
                        costs.insert(n.to_string(), new_cost);
                        parents.insert(n.to_string(), Some(node.clone()));
                    }
                }
                processed.push(node)
            }
            None => break,
        }
    }
    println!("costs: {:?}", costs);
    println!("parents: {:?}", parents);
}
