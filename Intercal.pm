package Acme::Intercal;

use strict;
use warnings;
use Keyword::Pluggable;
our $VERSION = '0.01';

sub import
{
	Keyword::Pluggable::define(
		keyword    => 'wax',
		package    => scalar(caller),
		expression => 1,
		code       => sub {
			my $r = shift;
			$$r =~ s/^/(/;
			while ( 1 ) {
				$$r =~ m/\G".*?"/gcs and next;
				$$r =~ m/\G'.*?'/gcs and next;
				$$r =~ m/\Gq[wqr]?\(.*?\)/gcs and next;
				$$r =~ m/\Gq[wqr]?\{.*?\}/gcs and next;
				$$r =~ m/\Gq[wqr]?\|.*?\|/gcs and next;
				$$r =~ m/\Gq[wqr]?\/.*?\//gcs and next;
				$$r =~ m/\G\b(wax|wane)\b/gcs and do {
					my $p = pos($$r);
					if ( $1 eq 'wax') {
						substr($$r, $p-3, 3, '(');
						pos($$r) = $p - 2;
					} else {
						substr($$r, $p-4, 4, ')');
						pos($$r) = $p - 3;
					}
					next;
				};
				$$r =~ m/\G[^w'"q]+/gcs and next;
				$$r =~ m/\G(.)/gcs and next;
				$$r =~ m/\G$/ and last;
			}
		}
	);
}

sub unimport
{
	Keyword::Pluggable::undefine keyword => 'wax', package => scalar(caller);
}

1;

=pod

=head1 NAME

Acme::Intercal - use C<wax> and C<wane>

=head1 SYNOPSIS


