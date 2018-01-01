#!/usr/bin/env perl6
use v6.c;

# base case
multi countdown(0) { say 0 }

# recursive case
multi countdown($i where { $i > 0 }) {
    say $i;
    countdown $i-1;
}

countdown 5;
