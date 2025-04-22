// You pass an array in, and it gets converted to a set.
let statesNeeded: Set<string> = new Set(["mt", "wa", "or", "id", "nv", "ut", "ca", "az"]);

const stations: Record<string, Set<string>> = {};
stations["kone"] = new Set(["id", "nv", "ut"]);
stations["ktwo"] = new Set(["wa", "id", "mt"]);
stations["kthree"] = new Set(["or", "nv", "ca"]);
stations["kfour"] = new Set(["nv", "ut"]);
stations["kfive"] = new Set(["ca", "az"]);

const finalStations: Set<string> = new Set();

while (statesNeeded.size) {
  let bestStation: string | null = null;
  let statesCovered: Set<string> = new Set();

  for (let station in stations) {
    const states = stations[station];
    const covered = new Set([...statesNeeded].filter(x => states.has(x)));

    if (covered.size > statesCovered.size) {
      bestStation = station;
      statesCovered = covered;
    }
  }

  statesNeeded = new Set([...statesNeeded].filter(x => !statesCovered.has(x)));

  if (bestStation !== null) {
    finalStations.add(bestStation);
  }
}

console.log(finalStations); // Set { 'kone', 'ktwo', 'kthree', 'kfive' }