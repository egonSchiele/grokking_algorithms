sub countdown {

    my $i = shift;

    print "$i\n";

    # base case:
    return if $i <= 1;

    # recursive case
    countdown( $i - 1 );

}

countdown(5);
