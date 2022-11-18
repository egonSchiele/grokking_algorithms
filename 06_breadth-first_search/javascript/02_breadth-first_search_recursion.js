const graph = {};
graph["you"] = ["alice", "bob", "claire"];
graph["bob"] = ["anuj", "peggy"];
graph["alice"] = ["peggy"];
graph["claire"] = ["thom", "jonny"];
graph["anuj"] = [];
graph["peggy"] = [];
graph["thom"] = [];
graph["jonny"] = [];

/**
 * Determine whether a person is a seller
 * @param {string} name Friend's name
 * @returns {boolean} Result of checking
 */
function personIsSeller(name) {
  return name[name.length - 1] === "m";
}

/**
 * Find a mango seller
 * @param {string} name Friend's name
 * @param {Object} graph Hash table
 * @returns {boolean} Search results
 */
function search(name, graph) {
  graph = graph || {};
  /**
   * Recursive function to check people
   * @param {Array} waited List of people you need to check
   * @param {Array} visited List of checked people
   */
  function inner(waited, visited) {
    waited = waited || [];
    if (waited.length === 0) return false;
    const person = waited[0];
    const waitedCloned = waited.slice(1);
    if (visited.indexOf(person) !== -1) return inner(waitedCloned, visited);
    if (personIsSeller(person)) {
      console.log(person + " is a mango seller!");
      return true;
    }
    return inner(waitedCloned.concat(graph[person]), visited.concat(person));
  }
  return inner(graph[name], []);
}

search("you", graph);
