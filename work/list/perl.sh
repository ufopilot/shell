use strict;
use warnings;
use feature 'say';

my $file1 = shift;
my $file2 = shift;

open my $fh1, "<", $file1 or die "Cannot open '$file1': $!";

while (<$fh1>) {
    my @F = split;
    open my $fh2, "<", $file2 or die "Cannot open '$file2': $!";
    # for each line of file1 file2 is reopened and read again
    while (my $cmp = <$fh2>) {
        my @C = split ' ', $cmp;
        if ($F[2] eq $C[2]) {       # check string equality
            say "$F[0]-$C[0] $F[1]-$C[1] $F[2]";
        }
    }
}
