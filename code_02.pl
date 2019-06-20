my $str = "a1a2a3a4a5";
while ( $str =~ /(a\d)/g ) {
    # /g modifier
    print "[$1] at position ", pos($str), "\n";
}

