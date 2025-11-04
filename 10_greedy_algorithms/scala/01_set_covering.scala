import scala.collection.mutable

// You pass a collection in, and it gets converted to a set.
val statesNeeded = mutable.Set("mt", "wa", "or", "id", "nv", "ut", "ca", "az")

val stations = mutable.Map[String, mutable.Set[String]](
  "kone" -> mutable.Set("id", "nv", "ut"),
  "ktwo" -> mutable.Set("wa", "id", "mt"),
  "kthree" -> mutable.Set("or", "nv", "ca"),
  "kfour" -> mutable.Set("nv", "ut"),
  "kfive" -> mutable.Set("ca", "az")
)

def mySetCovering(statesNeeded: mutable.Set[String], stations: mutable.Map[String, mutable.Set[String]]): Option[mutable.Set[String]] = {
  val finalStations = mutable.Set[String]()
  val remainingStations = mutable.Map[String, mutable.Set[String]]() ++ stations
  
  while(statesNeeded.nonEmpty) {
    var bestStation: Option[String] = None
    var statesCovered = mutable.Set[String]()
    
    for((station, statesForStation) <- remainingStations) {
      val covered = statesNeeded.intersect(statesForStation)
      if(covered.size > statesCovered.size && !finalStations.contains(station)) {
        bestStation = Some(station)
        statesCovered = covered
      }
    }
    
    if(bestStation.isDefined) {
      statesNeeded --= statesCovered
      finalStations += bestStation.get
      remainingStations.remove(bestStation.get)
    } else {
      return None
    }
  }
  
  Some(finalStations)
}

println(mySetCovering(statesNeeded, stations))

