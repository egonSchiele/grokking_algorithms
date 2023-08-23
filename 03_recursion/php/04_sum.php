<?php


function sum(array $arr)
{

    if (count($arr) == 1) {
        return $arr[0];
    } else {
        return $arr[0] + sum(array_slice($arr, 1));
    }
}

$total = sum([2, 4, 6]);
echo $total;
