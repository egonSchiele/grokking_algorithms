use std::collections::{HashMap, HashSet};

fn main() {
    let mut states_needed = HashSet::from(["mt", "wa", "or", "id", "nv", "ut", "ca", "az"]);

    let mut stations = HashMap::from([
        ("kone", HashSet::from(["id", "nv", "ut"])),
        ("ktwo", HashSet::from(["wa", "id", "mt"])),
        ("kthree", HashSet::from(["or", "nv", "ca"])),
        ("kfour", HashSet::from(["nv", "ut"])),
        ("kfive", HashSet::from(["ca", "az"])),
    ]);

    let mut final_stations = HashSet::new();
    while !states_needed.is_empty() {
        let mut best_station = None;
        let mut states_covered = HashSet::new();
        for (station, states_for_station) in &stations {
            let covered: HashSet<_> = states_needed
                .intersection(&states_for_station)
                .cloned()
                .collect();
            if covered.len() > states_covered.len() && !final_stations.contains(station) {
                best_station = Some(*station);
                states_covered = covered;
            }
        }
        match best_station {
            Some(station) => {
                states_needed = states_needed.difference(&states_covered).cloned().collect();
                final_stations.insert(station);
                stations.remove(station);
            }
            None => {
                println!("Coold not complete: {:?}", final_stations);
                break;
            }
        }
    }

    println!("{:?}", final_stations);
}
