'use strict';

// You pass an array in, and it gets converted to a set.
let states_needed = new Set(["mt", "wa", "or", "id", "nv", "ut", "ca", "az"]);

const stations = {};
stations["kone"] = new Set(["id", "nv", "ut"]);
stations["ktwo"] = new Set(["wa", "id", "mt"]);
stations["kthree"] = new Set(["or", "nv", "ca"]);
stations["kfour"] = new Set(["nv", "ut"]);
stations["kfive"] = new Set(["ca", "az"]);

const final_stations = new Set();


while (states_needed.size) {
  let best_station = null;
  let states_covered = new Set();
  for (let station in stations) {
    let states = stations[station];
    let covered = new Set([...states_needed].filter((x) => states.has(x)));
    if (covered.size > states_covered.size) {
      best_station = station;
      states_covered = covered;
    }
  }
  states_needed = new Set([...states_needed].filter((x) => !states_covered.has(x)));
  final_stations.add(best_station);
}

console.log(final_stations); // Set { 'kone', 'ktwo', 'kthree', 'kfive' }
