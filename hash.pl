use strict;
use warnings;

# Creating the first hash programmatically
my %hash1 = (
    apple1 => {
        color => "red",
        country => "Belarus",
        year => 2023
    },
    apple2 => {
        color => "green",
        country => "Russia",
        year => 2021
    }
);

# Creating the second hash programmatically
my %hash2 = (
    apple3 => {
        color => "yellow",
        country => "Italy",
        year => 2020
    },
    apple4 => {
        color => "red",
        country => "Poland",
        year => 2024
    }
);

# Combining two hashes
my %combined_hash = (%hash1, %hash2);

# Output the combined hash
print "Combined Hash:\n";
while (my ($key, $value) = each %combined_hash) {
    print "$key: { ";
    while (my ($inner_key, $inner_value) = each %{$value}) {
        print "$inner_key => $inner_value, ";
    }
    print "}\n";
}

# Search in the combined hash
print "Enter the key to search: ";
my $search_key = <STDIN>;
chomp $search_key;

my $position = 1;
my $found = 0;
while (my ($key, $value) = each %combined_hash) {
    if ($key eq $search_key) {
        print "Value for $search_key at position $position: { ";
        while (my ($inner_key, $inner_value) = each %{$value}) {
            print "$inner_key => $inner_value, ";
        }
        print "}\n";
        $found = 1;
        last;
    }
    $position++;
}

if (!$found) {
    print "Key not found in the hash.\n";
}
