my $str = "a1a2a3a4a5";
while ( $str =~ /(a\d)/ ) {
    # 무한 루프
    # pos($str)은 undefined
    print "[$1] at position ", pos($str), "\n";
}

