package Parser;
use strict;
use warnings;

use Log;

sub new {
    my ($class, %args) = @_;
    return bless \%args, $class;
}

sub parse {
    my ($self) = @_;
    open (my $fh, "<", $self->{filename}) or die "$!";

    my $resultArray = [];
    while (my $line = readline $fh) {
        my $elem = {};
        my @pairs = split ("\t", $line);
        foreach my $pair (@pairs) {
            $pair =~ /^(.+?):(.+)$/;
            my $key = $1;
            my $val = $2;
            if ($val ne "-") {
                $elem->{$key} = $val;
            }
        }
        push ($resultArray, Log->new(%$elem));
    }
    return $resultArray;
}

1;
