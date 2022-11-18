const graph = {};
graph.you = ["alice", "bob", "claire"];
graph.bob = ["anuj", "peggy"];
graph.alice = ["peggy"];
graph.claire = ["thom", "jonny"];
graph.anuj = [];
graph.peggy = [];
graph.thom = [];

/**
 * Determine whether a person is a seller
 * @param {string} name Friend's name
 * @returns {boolean} Result of checking
 */
const isSeller = name => name[name.length - 1] === "m";

/**
 * Find a mango seller
 * @param {string} name Friend's name
 * @param {Object} graph Hash table
 * @returns {boolean} Search results
 */
const search = (name, graph = {}) => {
  /**
   * Recursive function to test people
   * @param {Array} waited List of people you need to check
   * @param {Set} visited List of checked people
   */
  const iter = (waited = [], visited) => {
    if (waited.length === 0) return false;
    const [current, ...rest] = waited;
    if (visited.has(current)) return iter(rest, visited);
    if (isSeller(current)) {
      console.log(`${current} is a mango seller!`);
      return true;
    }
    visited.add(current);
    const personFriends = graph[current];
    return iter([...rest, ...personFriends], visited);
  };
  return iter(graph[name], new Set());
};

search("you", graph);
