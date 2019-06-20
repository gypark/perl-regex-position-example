use strict;
use warnings;

foreach my $str (
    "a1a2a3a4a5",
    "a1a2!!a4a5",       # a2 뒤에 a3이 없는 경우
    "a1a2a9a3a4a5",     # a2 와 a3 사이에 다른 매치가 있는 경우
    "a1a3a4a5",         # a2가 없는 경우
) {
    print "---------- $str ----------\n";
    # code_05 에서 사용한 /c, \G
    print " 1. using /c, \\G\n";
    while ( $str =~ /(a\d)/g ) {
        print "[$1] at position ", pos($str), "\n";
        if ( $1 eq "a2" ) {
            $str =~ /\Ga3/gc;
        }
    }

    # 백레퍼런스에 이름을 붙여 사용
    # a2a3 이 매치되면 그 중 a2에,
    # 그 외의 경우는 a<숫자>에 PAT 백레퍼런스가 생긴다
    print " 2. named backreference\n";
    while ( $str =~ /(?<PAT>a2)a3|(?<PAT>a\d)/g ) {
        print "[$+{PAT}] at position ", pos($str), "\n";
    }

    # 또는
    # 캡처그룹 번호 리셋 (?| ... )
    print " 3. alternative capture group numbering\n";
    # 그룹번호:         $1     $1
    while ( $str =~ /(?|(a2)a3|(a\d))/g ) {
        print "[$1] at position ", pos($str), "\n";
    }

    # 또는
    # 바로 앞에 a2가 있지 않은(부정적 룩비하인드) a3, 또는 a<3이 아닌 숫자>
    print " 3. lookbehind\n";
    while ( $str =~ /((?<!a2)a3|(?:a[012456789]))/g ) {
        print "[$1] at position ", pos($str), "\n";
    }
}
