# lib/MooClass.pm
package MooClass;
use Moo;
use Types::Standard qw< StrMatch >;
extends qw< MooseClass >;
has '+endpoint' => ( isa => StrMatch[ qr{^https?://.+pwc.com/?$} ] );
1;
