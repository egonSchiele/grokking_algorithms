const graph = {};
graph.you = ['alice', 'bob', 'claire'];
graph.bob = ['anuj', 'peggy'];
graph.alice = ['peggy'];
graph.claire = ['thom', 'jonny'];
graph.anuj = [];
graph.peggy = [];
graph.thom = [];

const isSeller = name => name[name.length - 1] === 'm';

const search = (name, graph) => {
  const iter = (waited, visited) => {
    if (waited.length === 0) {
      return false;
    }
    const [current, ...rest] = waited;
    if (visited.has(current)) {
      return iter(rest, visited);
    }
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

search('you');
