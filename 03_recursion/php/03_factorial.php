<?php

function fact($x)
{
    if ($x === 1) {
        return 1;
    }
    return $x * fact($x - 1);
}

echo fact(5);
