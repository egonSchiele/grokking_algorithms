<?php

function findSmall(array $arr)
{
    $smallest = $arr[0];
    $smallestIndex = 0;
    for ($i = 0; $i < count($arr); $i++) {
        if ($arr[$i] < $smallest) {
            $smallest = $arr[$i];
            $smallestIndex = $i;
        }
    }
    return $smallestIndex;
}

function selectionSort(array $arr)
{
    $newArr = [];
    for ($i = 0, $length = count($arr); $i < $length; $i++) {
        $smallest = findSmall($arr);
        array_push($newArr, array_splice($arr, $smallest, 1)[0]);
    }
    return $newArr;
}

var_dump(selectionSort([5, 3, 6, 2, 10])); // [2, 3, 5, 6, 10]
