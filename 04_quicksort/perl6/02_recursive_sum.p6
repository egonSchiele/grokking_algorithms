#!/usr/bin/env perl6
use v6.c;

multi sum([]) { 0 };
multi sum(@arr) { @arr[0] + sum(@arr[1..*]) }

my @arr = 1,2,3,4,5;
say sum(@arr);
