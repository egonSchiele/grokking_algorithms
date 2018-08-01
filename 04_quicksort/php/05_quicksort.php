<?php

function quicksort(array $array) {
    if (count($array) < 2) {
        // base case, arrays with 0 or 1 element are already "sorted"
        return $array;
    } else {
        // recursive case
        $pivot = $array[0];
        var_dump($array);

        // sub-array of all the elements less than the pivot
        $less = array_filter(array_slice($array, 1), function($el) use ($pivot) { return $el <= $pivot; });

        // sub-array of all the elements greater than the pivot
        $greater = array_filter(array_slice($array, 1), function($el) use ($pivot) { return $el > $pivot; });
        return array_merge(quicksort($less), [$pivot], quicksort($greater));
  }
}

var_dump(quicksort([10, 5, 2, 3])); // [2, 3, 5, 10]
