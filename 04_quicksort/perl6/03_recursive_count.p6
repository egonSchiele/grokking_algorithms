#!/usr/bin/env perl6
use v6.c;

multi count([]) { 0 }
multi count(@arr) { 1 + count(@arr[1..*]) }

my @arr = 1,2,3,4,5;
say count(@arr);
