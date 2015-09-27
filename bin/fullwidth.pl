# http://stackoverflow.com/questions/8326846/convert-ascii-chars-to-unicode-fullwidth-latin-letters-in-python

#!/usr/bin/env perl
# uniwide
use utf8;
use strict;
use warnings;
use open qw(:std :utf8);

while (<>) {
    s/\s/\x{A0}\x{A0}/g if tr
      <!"#$%&´()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~¢£>
      <！＂＃＄％＆＇（）＊＋，－．／０１２３４５６７８９：；＜＝＞？＠ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ［＼］＾＿｀ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ｛｜｝～￠￡>;;
} continue {
      print;
}

close(STDOUT) || die "can't close stdout: $!";
