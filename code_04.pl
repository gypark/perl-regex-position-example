my $str = "a1a2a3a4a5";
# my $str = "a1a2!!a4a5";             # 이 경우는 무한루프
# my $str = "a1a2a9a3a4a5";           # a9를 스킵해버림
while ( $str =~ /(a\d)/g ) {
    print "[$1] at position ", pos($str), "\n";
    if ( $1 eq "a2" ) {
        # a3 을 매치시켜서 포지션 이동
        $str =~ /a3/g;
    }
}
