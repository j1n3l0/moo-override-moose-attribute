# moo-override-moose-attribute

According to the [Moo docs for has](https://metacpan.org/pod/Moo#has) I should be able to override an inherited attribute like so:

```perl
has '+attribute_name' => ( ... );
```

However when I define a Moo class:

```perl
# lib/MooClass.pm
package MooClass;
use Moo;
use Types::Standard qw< StrMatch >;
extends qw< MooseClass >;
has '+endpoint' => ( isa => StrMatch[ qr{^https?://.+pwc.com/?$} ] );
1;
```

To inherit from a Moose class:

```perl
# lib/MooseClass.pm
package MooseClass;
use Moose;
use Types::Standard qw< Str >;
has endpoint => ( is => 'ro', isa => Str, required => 1 );
__PACKAGE__->meta->make_immutable();
```

And try to instantiate it:

```perl
# t/moo-inherit-moose-attribute.t
use Test2::V0 -target => 'MooClass';

subtest 'A Moo class inheriting from a Moose class' => sub {
    ok( lives { $CLASS->new( endpoint => 'https://dev-pwc.com' ) },
        'should override the attribute via "+attribute_name"'
    ) || diag $@;
};

done_testing();
```

I get the following error:

```
has '+endpoint' given but no endpoint attribute already exists at lib/MooClass.pm line 6.
```

Is it not possible for Moo to inherit Moose classes in this way?
