sub binary_search {

    my ( $item, @list ) = @_;

    # The borders inside where we are searching in:
    my $low  = 0;
    my $high = scalar(@list);

    # Do that until found or until just one element remains:
    while ( $low <= $high ) {

        # Detect the middle of the array:
        my $mid = int( ( $low + $high ) / 2 );
        my $guess = $list[$mid];

        # We found it out:
        if ( $guess == $item ) {
            return $mid;
        }

        # The guess is too high, decrease it:
        elsif ( $guess > $item ) {
            $high = --$mid;
        }

        # The guess is too low, increase it:
        else {
            $low = ++$mid;
        }
    }

    # Nothing at all found:
    return 'None';

}

my @my_list = qw /1 3 5 7 9/;

# Should display "1":
print binary_search( 3, @my_list ), "\n";

# Should display "None":
print binary_search( -1, @my_list ), "\n";
