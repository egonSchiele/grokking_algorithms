// A set of all the states we need to cover
let statesNeeded: Set<string> = new Set(["mt", "wa", "or", "id", "nv", "ut", "ca", "az"]);

// An object mapping each station to the set of states it covers
const stations: Record<string, Set<string>> = {
  kone: new Set(["id", "nv", "ut"]),
  ktwo: new Set(["wa", "id", "mt"]),
  kthree: new Set(["or", "nv", "ca"]),
  kfour: new Set(["nv", "ut"]),
  kfive: new Set(["ca", "az"]),
};


const finalStations: Set<string> = new Set();


while (statesNeeded.size > 0) {
  let bestStation: string | null = null;
  let statesCovered: Set<string> = new Set();

  // Find the station that covers the most uncovered states
  for (const station in stations) {
    const states = stations[station];
    const covered = new Set([...statesNeeded].filter(state => states.has(state)));

    if (covered.size > statesCovered.size) {
      bestStation = station;
      statesCovered = covered;
    }
  }


  statesNeeded = new Set([...statesNeeded].filter(x => !statesCovered.has(x)));


  if (bestStation) {
    finalStations.add(bestStation);
  }
}

console.log(finalStations); // Set { 'kone', 'ktwo', 'kthree', 'kfive' }