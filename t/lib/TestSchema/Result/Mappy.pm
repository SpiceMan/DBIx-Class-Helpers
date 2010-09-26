package TestSchema::Result::Mappy;

use DBIx::Class::Candy
   -components => ['Helper::Row::ToJSON', 'InflateColumn::DateTime'];

__PACKAGE__->mk_classdata(
    mapper => {
        DateTime => sub { my $dt = shift; $dt->hms . ' '. $dt->ymd() },
    },
);

table 'Mappy';

column 'id';
column 'somedate' => {
    data_type => 'date',
};

primary_key 'id';


1;
