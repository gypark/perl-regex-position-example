my $str = "a1a2a3a4a5";
# my $str = "a1a2!!a4a5";
# my $str = "a1a2a9a3a4a5";
while ( $str =~ /(a\d)/g ) {
    print "[$1] at position ", pos($str), "\n";
    if ( $1 eq "a2" ) {
        # a3 을 매치시켜서 포지션 이동
        # /c - a3 매치에 실패하더라도 포지션을 리셋하지 않음
        # \G - a2 매치에 성공한 그 지점을 나타내는 앵커
        $str =~ /\Ga3/gc;
    }
}
