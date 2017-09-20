<?php

function countdown($i)
{
    echo $i;
    // base case
    if ($i <= 0) {
        return;
    } else {
        countdown($i - 1);
    }
}

countdown(5);
