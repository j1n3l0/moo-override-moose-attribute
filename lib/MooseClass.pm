# lib/MooseClass.pm
package MooseClass;
use Moose;
use Types::Standard qw< Str >;
has endpoint => ( is => 'ro', isa => Str, required => 1 );
__PACKAGE__->meta->make_immutable();
