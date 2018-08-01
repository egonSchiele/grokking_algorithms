#!/usr/bin/env perl6
use v6.c;

# Finds the smallest value in an array
sub findSmallest(@arr) {
    # Stores the smallest value
    my $smallest = @arr[0];
    # Stores the index of the smallest value
    my $smallest-index = 0;
    for 1..^@arr.elems {
        if @arr[$_] < $smallest {
            $smallest = @arr[$_];
            $smallest-index = $_;
        }
    }
    return $smallest-index;
}

# Sort array
sub selectionSort(@arr) {
    my @newArr;
    for ^@arr.elems {
        # Finds the smallest element in the array and adds it to the new array
        my $smallest = findSmallest(@arr);
        @newArr.append: @arr.splice($smallest, 1);
    }
    return @newArr;
}

my @unsorted-array = 5, 3, 6, 2, 10;
say selectionSort(@unsorted-array);
