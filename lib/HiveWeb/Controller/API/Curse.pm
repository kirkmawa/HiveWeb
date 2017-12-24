package HiveWeb::Controller::API::Curse;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

sub index :Path :Args(0)
	{
	my ($self, $c) = @_;

	$c->detach('list');
	}

sub list :Local :Args(0)
	{
	my ($self, $c) = @_;

	my $out = $c->stash()->{out};
	$out->{response} = 0;
	my $user = $c->user() || return;

	my $curses = $user->member_curses()->search_related('curse', { lifted_at => undef }, { order_by => [ 'priority', 'issued_at' ] });

	$out->{curses}   = $curses->all();
	$out->{response} = \1;
	}

=head1 AUTHOR

Greg Arnold

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
