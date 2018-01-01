#!/usr/bin/env perl6
use v6.c;

sub my-max(@arr) {
    if @arr.elems == 2 { return (@arr[0] > @arr[1]) ?? @arr[0] !! @arr[1] }
    my $sub-max = my-max(@arr[1..*]);
    return (@arr[0] > $sub-max) ?? @arr[0] !! $sub-max;
}

my @arr = 1,2,3,4,5;
say my-max(@arr);
