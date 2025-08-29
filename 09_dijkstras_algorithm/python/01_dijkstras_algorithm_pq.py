import heapq
# algorithm using priority queue
# this code is a direct copy from https://bradfieldcs.com/algos/graphs/dijkstras-algorithm/
# with only minor changes
def calculate_distances(graph, starting_vertex):
    distances = {vertex: float('infinity') for vertex in graph}

    pq = [(0, starting_vertex)]
    while len(pq) > 0:
        current_distance, current_vertex = heapq.heappop(pq)
        # Nodes can get added to the priority queue multiple times. We only
        # process a vertex the first time we remove it from the priority queue.
        if current_distance > distances[current_vertex]:
            continue

        for neighbor, weight in graph[current_vertex].items():
            distance = current_distance + weight

            # Only consider this new path if it's better than any path we've
            # already found.
            if distance < distances[neighbor]:
                distances[neighbor] = distance
                heapq.heappush(pq, (distance, neighbor))
    distances.pop(starting_vertex)
    return distances

example_graph = {
    'start': {'a': 6, 'b': 2},
    'a': {'fin': 1},
    'b': {'a': 3, 'fin': 5},
    'fin': {}
}
print(calculate_distances(example_graph, 'start'))