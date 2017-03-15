import Foundation

// You pass an array in, and it gets converted to a set.
var statesNeeded : Set = ["mt", "wa", "or", "id", "nv", "ut", "ca", "az"]

var stations = [String: Set<String>]()
stations["kone"] = ["id", "nv", "ut"]
stations["ktwo"] = ["wa", "id", "mt"]
stations["kthree"] = ["or", "nv", "ca"]
stations["kfour"] = ["nv", "ut"]
stations["kfive"] = ["ca", "az"]

var finalStations = Set<String>();

while !statesNeeded.isEmpty {
    var bestStation = String()
    var statesCovered = Set<String>()
    
    for station in stations {
        var covered = statesNeeded.intersection(station.value)
        if covered.count > statesCovered.count {
            bestStation = station.key
            statesCovered = covered
        }
        statesNeeded = statesNeeded.subtracting(statesCovered)
        //Swift note: We should avoid adding empty station to Set
        if !bestStation.isEmpty {
            finalStations.insert(bestStation)
        }
    }
}

print(finalStations) // -> ["kone", "kfive", "ktwo", "kthree"]


