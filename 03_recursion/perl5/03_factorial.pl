sub fact {

    my $x = shift;

    if ( $x == 1 ) {
        return 1;
    }
    else {
        return $x * fact( $x - 1 );
    }
}

print fact(5), "\n";
