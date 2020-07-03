# t/moo-override-moose-attribute.t
use Test2::V0 -target => 'MooClass';

subtest 'A Moo class inheriting from a Moose class' => sub {
    ok( lives { $CLASS->new( endpoint => 'https://dev-pwc.com' ) },
        'should override the attribute via "+attribute_name"'
    ) || diag $@;
};

done_testing();
