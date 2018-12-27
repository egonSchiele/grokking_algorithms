<?php

// You need to install Data Structures (DS) extension. 
// Mode details - http://php.net/manual/en/book.ds.php
use \Ds\Set;

$statesNeeded = new Set(["mt", "wa", "or", "id", "nv", "ut", "ca", "az"]);

$stations = [];
$stations["kone"] = new Set(["id", "nv", "ut"]);
$stations["ktwo"] = new Set(["wa", "id", "mt"]);
$stations["kthree"] = new Set(["or", "nv", "ca"]);
$stations["kfour"] = new Set(["nv", "ut"]);
$stations["kfive"] = new Set(["ca", "az"]);

$finalStations = new Set();

while (!$statesNeeded->isEmpty()) {
    $bestStation = null;
    $statesCovered = new Set();

    foreach (array_keys($stations) as $station) {
        $states = $stations[$station];
        $covered = new Set($statesNeeded);
        $covered = $covered->filter(function ($value) use ($states) {
            return $states->contains($value);
        });

        if ($covered->count() > $statesCovered->count()) {
            $bestStation = $station;
            $statesCovered = $covered;
        }
    }

    $statesNeeded = new Set($statesNeeded);
    $statesNeeded = $statesNeeded->filter(function ($value) use ($statesCovered) {
        return !$statesCovered->contains($value);
    });
    $finalStations->add($bestStation);
}

print_r($finalStations); // ["kone", "ktwo", "kthree", "kfive"]