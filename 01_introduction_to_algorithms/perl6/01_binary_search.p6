#!/usr/bin/env perl6
use v6.c;

sub binary-search(@arr, $item){
    # low and high keep track of which part of the array you'll search in.
    my $low = 0;
    my $high = @arr.elems - 1;

    # While you haven't narrowed it down to one element ...
    while $low <= $high {
        # ... check the middle element
        my $mid = ($low + $high) div 2;
        my $guess = @arr[$mid];
        # Found the item.
        if $guess ~~ $item {
            return $mid;
        }
        # The guess was too high.
        if $guess > $item {
            $high = $mid - 1;
        }
        # The guess was too low.
        else {
            $low = $mid + 1;
        }
    }
    # Item doesn't exist
    return Nil;
}

my @arr = 1, 3, 5, 7, 9;
say binary-search(@arr, 3); # => 1

# We use 'Nil' to indicate that the item wasn't found.
say binary-search(@arr, -1); # => Nil
