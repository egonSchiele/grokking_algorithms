import java.util.*;
// Suggested to be run with Java 17+
public class DijkstrasAlgorithmPriorityQueue {
    // the graph
    private static final Map<String, Set<Tuple>> GRAPH = new HashMap<>(4);
    static {
        Set<Tuple> start = new HashSet<>(2);
        start.add(new Tuple("a", 6));
        start.add(new Tuple("b", 2));
        GRAPH.put("start", start);

        GRAPH.put("a", new HashSet<>(1));
        GRAPH.get("a").add(new Tuple("fin", 1));

        Set<Tuple> b = new HashSet<>(2);
        b.add(new Tuple("a", 3));
        b.add(new Tuple("fin", 5));
        GRAPH.put("b", b);
        GRAPH.put("fin", new HashSet<>(1));
    }

    public static void main(String[] args) {
        System.out.println("Cost from the start to each node:");
        System.out.println(calculateDistances("start")); // { a: 5, b: 2, fin: 6 }
    }

    private static Map<String, Double> calculateDistances(final String startVertex) {
        // The costs table
        Map<String, Double> costs = new HashMap<>();
        PriorityQueue<Tuple> pq = new PriorityQueue<>(Comparator.comparing(Tuple::cost));
        pq.add(new Tuple(startVertex, 0));
        Tuple node;
        while ((node = pq.poll())!=null && node.cost <= costs.getOrDefault(node.vertex,  Double.POSITIVE_INFINITY)) {
            // Go through all the neighbors of this node
            Set<Tuple> neighbors = GRAPH.getOrDefault(node.vertex, Collections.emptySet());
            for (Tuple n : neighbors) {
                double newCost = node.cost + n.cost;
                // If it's cheaper to get to this neighbor by going through this node
                if (node.cost < newCost) {
                    // ... update the cost for this node
                    costs.put(n.vertex, newCost);
                    pq.add(new Tuple(n.vertex, newCost));
                }
            }
        }
        return costs;
    }

    private record Tuple(String vertex, double cost) {
    }
}