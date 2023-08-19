// Граф
private val graph: MutableMap<String, MutableMap<String, Double>> = HashMap()

// Список отслеживания обработанных узлов
private val processed: MutableList<String> = ArrayList()

fun main() {
    graph["start"] = HashMap()
    graph["start"]!!["a"] = 6.0
    graph["start"]!!["b"] = 2.0
    graph["a"] = HashMap()
    graph["a"]!!["fin"] = 1.0
    graph["b"] = HashMap()
    graph["b"]!!["a"] = 3.0
    graph["b"]!!["fin"] = 5.0
    graph["fin"] = HashMap()

    // Стоимость узлов
    val costs: MutableMap<String, Double> = HashMap()
    costs["a"] = 6.0
    costs["b"] = 2.0
    costs["fin"] = Double.POSITIVE_INFINITY

    // Таблица родителей
    val parents: MutableMap<String, String?> = HashMap()
    parents["a"] = "start"
    parents["b"] = "start"
    parents["fin"] = null


    println("Cost from the start to each node:")
    println(dijkstraAlgorithm(costs, parents))
}

fun dijkstraAlgorithm(costs: MutableMap<String, Double>,
                      parents: MutableMap<String, String?>): MutableMap<String, Double> {

    var node = findLowestCostNode(costs)
    while (node != null) {
        val cost = costs[node]
        // Перебрать всех соседей текущего узла
        val neighbors: Map<String, Double> = graph[node]!!
        for (n in neighbors.keys) {
            val newCost = cost!! + neighbors[n]!!
            // Если к соседу можно быстрее добраться через текущий узел...
            if (costs[n]!! > newCost) {
                // ... обновить стоимость для этого узла
                costs[n] = newCost
                // Этот узел становится новым родителем для соседа
                parents[n] = node
            }
        }
        // Узел помечается как обработанный
        processed.add(node)

        // Найти следующий узел для обработки и повторить цикл
        node = findLowestCostNode(costs)
    }
    return  costs // { a: 5, b: 2, fin: 6 }
}

private fun findLowestCostNode(costs: Map<String, Double>): String? {
    var lowestCost = Double.POSITIVE_INFINITY
    var lowestCostNode: String? = null

    // Перебрать все узлы
    for ((key, cost) in costs) {
        // Если это узел с наименьшей стоимостью из уже виденных и
        // он еще не был обработан...
        if (cost < lowestCost && !processed.contains(key)) {
            // ... он назначается новым узлом с наименьшей стоимостью
            lowestCost = cost
            lowestCostNode = key
        }
    }
    return lowestCostNode
}