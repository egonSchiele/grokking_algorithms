graph = {}

graph["you"] = ["alice", "claire", "bob"]
graph["bob"] = ["peggy", "anuj"]
graph["alice"] = ["peggy"]
graph["claire"] = ["jonny", "thom"]
graph["anuj"] = []
graph["peggy"] = []
graph["jonny"] = []
graph["thom"] = []

bfs = (name) ->
  deque = graph[name][..]
  checked = []
  
  while deque.length > 0
    pessoa = deque.shift()
    
    if pessoa not in checked
      if personIsSeller(pessoa)
        return true
      else
        deque = deque.concat(graph[pessoa])
        checked.push(pessoa)
  
  return false


personIsSeller = (name) ->
  name[name.length - 1] is "m"

console.log bfs("you")