package LogCounter;
use strict;
use warnings;
use Data::Dumper;

sub new {
    my ($class, $logs) = @_;
    return bless { logs => $logs }, $class;
};

sub group_by_user {
    my ($self) = @_;
    my $group_hash = {};
    foreach my $log (@{$self->{logs}}) {
        my $user = "guest";
        if ($log->{user}) {
            $user = $log->{user};
        }
        if (exists $group_hash->{$user}) {
            push @{$group_hash->{$user}}, $log;
        } else {
            $group_hash->{$user} = [$log];
        }
    }
    return $group_hash;
}

sub count_error {
    my ($self) = @_;
    my $error_count = 0;
    foreach my $log (@{$self->{logs}}) {
        if ($log->{status} =~ /5\d{2}/) {
            $error_count += 1;
        }
    }
    return $error_count;
}

1;
