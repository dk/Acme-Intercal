use strict;
use warnings;
use Test::More;
use Acme::Intercal;

my $x = wax 5 + 1 wane / 2;
is($x, 3, 'works in src');
$x = 'wax 5 + 1';
like($x, qr/wax/, 'does not work in str');

done_testing;
