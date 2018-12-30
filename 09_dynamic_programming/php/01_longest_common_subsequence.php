<?php

/**
 * @param string $stringA
 * @param string $stringB
 * @return array
 */
function search(string $stringA, string $stringB): array
{
    $cell = [];

    for ($i = 0; $i < strlen($stringA); $i++) {
        for ($j = 0; $j < strlen($stringB); $j++) {
            if ($stringA[$i] === $stringB[$j]) {
                if (isset($cell[$i - 1][$j - 1])) {
                    $cell[$i][$j] = $cell[$i - 1][$j - 1] + 1;
                } else {
                    $cell[$i][$j] = 1;
                }
            } else {
                if (isset($cell[$i - 1][$j]) || isset($cell[$i][$j - 1])) {
                    $cell[$i][$j] = max(
                        isset($cell[$i - 1][$j]) ? $cell[$i - 1][$j] : 0,
                        isset($cell[$i][$j - 1]) ? $cell[$i][$j - 1] : 0
                    );
                } else {
                    $cell[$i][$j] = 0;
                }
            }
        }
    }

    return $cell;
}

print_r(search('fish', 'fosh'));

/*
[      f o s h
    f [1,1,1,1],
    i [1,1,1,1],
    s [1,1,2,2],
    h [1,1,2,3]
]
*/