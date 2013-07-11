package Log;
use strict;
use warnings;

use DateTime;

sub new {
    my ($class, %args) = @_;
    return bless \%args, $class;
}

sub protocol {
	my ($self) = @_;
	my @splitted = split (/ /, $self->{req});
	return $splitted[2];
}

sub method {
	my ($self) = @_;
	my @splitted = split (/ /, $self->{req});
	return $splitted[0];
}

sub path {
	my ($self) = @_;
	my @splitted = split (/ /, $self->{req});
	return $splitted[1];
}

sub uri {
	my ($self) = @_;
	return "http://" . $self->{host} . $self->path;
}

sub time {
	my ($self) = @_;
	my $dt = DateTime->from_epoch (
		time_zone => "Asia/Tokyo",
		epoch => $self->{epoch},
	);
	return $dt->format_cldr ("yyyy-MM-ddTHH:mm:ss");
}

1;
