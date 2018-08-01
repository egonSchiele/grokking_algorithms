<?php

function recursiveMax($list) {
    if (count($list) === 2) {
        return $list[0] > $list[1] ? $list[0] : $list[1];
    }
  $subMax = recursiveMax(array_splice($list, 1));
  return $list[0] > $subMax ? $list[0] : $subMax;
}

echo recursiveMax([1, 5, 10, 25, 16, 1]); // 25
