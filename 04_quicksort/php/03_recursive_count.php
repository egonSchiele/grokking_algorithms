<?php

function recursiveCount($list) {
    if (count($list) === 0) {
        return 0;
    }
  return 1 + recursiveCount(array_splice($list, 1));
}

echo count([0, 1, 2, 3, 4, 5]); // 6
