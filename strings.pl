use strict;
use warnings;

print "Input string: ";
my $string = <STDIN>;
chomp $string; 

print "Input substring to find: ";
my $substring = <STDIN>;
chomp $substring;

my $index = index($string, $substring);

if ($index != -1) {
    my $char_index = length(substr($string, 0, $index));
    print "Index: $char_index.\n";
} else {
    print "No find.\n";
}
