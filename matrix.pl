use strict;
use warnings;

# Prompt for inputting the matrix size
print "Enter the number of rows in the matrix: ";
my $rows = <STDIN>;
print "Enter the number of columns in the matrix: ";
my $cols = <STDIN>;

# Creating an empty matrix
my @matrix;

# Prompt for inputting matrix data
for my $i (0..$rows-1) {
    for my $j (0..$cols-1) {
        print "Enter the element [$i][$j]: ";
        $matrix[$i][$j] = <STDIN>;
        chomp $matrix[$i][$j];  # Remove newline character
    }
}

# Output the initial matrix
print "Initial matrix:\n";
for my $i (0..$rows-1) {
    for my $j (0..$cols-1) {
        print $matrix[$i][$j] . " ";
    }
    print "\n";
}

# Finding the sum of numbers along the diagonal
my $diag_sum = 0;
for my $i (0..min($rows, $cols)-1) {
    $diag_sum += $matrix[$i][$i];
}

# Finding the minimum and maximum elements
my $min_element = $matrix[0][0];
my $max_element = $matrix[0][0];
for my $i (0..$rows-1) {
    for my $j (0..$cols-1) {
        $min_element = $matrix[$i][$j] if $matrix[$i][$j] < $min_element;
        $max_element = $matrix[$i][$j] if $matrix[$i][$j] > $max_element;
    }
}

# Output the results
print "Sum of numbers along the diagonal: $diag_sum\n";
print "Minimum element: $min_element\n";
print "Maximum element: $max_element\n";
print "Matrix sorted in ascending order:\n";

# Convert the matrix into a one-dimensional array
my @flattened_matrix = map { @$_ } @matrix;
# Sorting the one-dimensional array
my @sorted_matrix = sort { $a <=> $b } @flattened_matrix;
# Splitting the sorted array back into matrix rows
my @sorted_rows;
push @sorted_rows, [splice @sorted_matrix, 0, scalar @{ $matrix[0] } ] while @sorted_matrix;
# Printing the sorted matrix
foreach my $row (@sorted_rows) {
    foreach my $element (@$row) {
        print $element . " ";
    }
    print "\n";
}

# Function to find the minimum
sub min {
    my ($a, $b) = @_;
    return $a < $b ? $a : $b;
}
