# Detect the smallest value in an array
sub findSmallest {

    my @arr = @_;

    my $smallest       = $arr[0];    # Keep the smallest value
    my $smallest_index = 0;          # Keep the index of the smallest value

    for ( my $i = 1; $i <= $#arr; $i++ ) {
        $smallest_index = $i if $arr[$i] < $smallest;
    }

    return $smallest_index;
}

# Sort array
sub selectionSort {

    my @arr = @_;

    my @newArr = ();

    for ( 0 .. $#arr ) {
        my $smallest_index = findSmallest(@arr);    # Find the smallest element in the array
        push @newArr, $arr[$smallest_index];        # Add it to the new array
        splice( @arr, $smallest_index, 1 );         # Delete that element
    }

    return @newArr;
}

print join( ' ', selectionSort( 5, 3, 6, 2, 10 ) ), "\n";
