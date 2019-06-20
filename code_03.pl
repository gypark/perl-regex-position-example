my $str = "a1a2a3a4a5";
while ( $str =~ /(a\d)/gc ) {
    print "[$1] at position ", pos($str), "\n";
}

# /c 때문에 $str의 포지션은 여전히 10이고, 따라서 아래 루프의 매치는 실패
while ( $str =~ /(a\d)/g ) {
    print "Again, [$1] at position ", pos($str), "\n";
}
