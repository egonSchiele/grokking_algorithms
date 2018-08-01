#!/usr/bin/env perl6
use v6.c;

sub quicksort(@arr) {
    if @arr.elems < 2 {
        # base case, arrays with 0 or 1 element are already "sorted"
        return @arr;
    }
    else {
        # recursive case
        my $pivot = @arr[0];
        # sub-array of all the elements less than the pivot
        my @less = (gather for @arr[1..*] { take $_ if $_ <= $pivot });
        # sub-array of all the elements greater than the pivot
        my @greater = (gather for @arr[1..*] { take $_ if $_ > $pivot });
        return (|quicksort(@less), $pivot, |quicksort(@greater));
    }
}

my @arr = 10, 5, 2, 3;
say quicksort(@arr);
