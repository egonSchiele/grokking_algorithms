<?php

function sum($list)
{
    if (count($list) === 0) {
        return 0;
    }
  return $list[0] + sum(array_splice($list, 1));
}

echo sum([1, 2, 3, 4]); // 10
