{
    package FooDT;

    sub new { bless {}, shift; }
    sub hms { "22:22:22" }
    sub ymd { "1111-11-11" }
}

package TestSchema::Result::Mappy;

use DBIx::Class::Candy
   -components => ['Helper::Row::ToJSON'];

__PACKAGE__->mk_classdata(
    mapper => {
        FooDT => sub { my $dt = shift; $dt->hms . ' ' . $dt->ymd },
    },
);

table 'Mappy';

column 'id';
column 'somedate';

primary_key 'id';

sub get_column {
    my $self = shift;
    my ($f) = @_;

    if( $f eq "somedate" ) {
        return FooDT->new;
    }
    $self->next::method(@_);
}

1;
