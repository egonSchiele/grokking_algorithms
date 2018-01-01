#!/usr/bin/env perl6
use v6.c;

sub sum(@arr) {
    my $total = 0;
    for @arr {
        $total += $_;
    }
    return $total;
}

my @arr = 1, 2, 3, 4;
say sum(@arr);
