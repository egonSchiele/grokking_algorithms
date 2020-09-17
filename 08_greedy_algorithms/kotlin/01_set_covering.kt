var statesNeeded = setOf("mt", "wa", "or", "id", "nv", "ut", "ca", "az")
val stations = mapOf(
    "kone" to setOf("id", "nv", "ut"),
    "ktwo" to setOf("wa", "id", "mt"),
    "kthree" to setOf("or", "nv", "ca"),
    "kfour" to setOf("nv", "ut"),
    "kfive" to setOf("ca", "az")
)

fun main() {
    val finalStations = mutableSetOf<String>()
    while (statesNeeded.isNotEmpty()) {
        var bestStation: String? = null
        var statesCovered = setOf<String>()
        stations.forEach { (station, states) ->
            val covered = statesNeeded.intersect(states)
            if (covered.size > statesCovered.size) {
                bestStation = station
                statesCovered = covered
            }
        }
        statesNeeded = statesNeeded - statesCovered
        bestStation?.let { finalStations.add(it) }
    }
    println(finalStations)
}