#!/usr/bin/env perl6
use v6.c;

multi fact(1) { 1 }
multi fact($x where { $x > 1 }) { $x * fact($x-1) }

say fact(5);
