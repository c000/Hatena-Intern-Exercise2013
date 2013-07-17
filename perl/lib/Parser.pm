package Parser;
use strict;
use warnings;

sub new {
    my ($class, %args) = @_;
    return bless \%args, $class;
}

sub parse {
    my ($self) = @_;
    open (my $fh, "<", $self->{filename}) or die "$!";
    return $self->{filename};
}

1;
