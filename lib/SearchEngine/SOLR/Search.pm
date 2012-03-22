package SearchEngine::SOLR::Search;
use Moose::Role;

use Data::SearchEngine::Solr;
use Data::SearchEngine::Query;
use Data::Dump qw(dump);

has solr => (
    is => 'ro',
    lazy => 1,
    default => sub {
        Data::SearchEngine::Solr->new(
           url => 'http://192.168.1.37:8983/solr/devsolr',
           options => {
               fq => 'recordtype:biblio',
               facets => 'true'
           }
        );
    }
);

has indexes => (
    is => 'ro',
    lazy => 1,
    default => sub {
#        my $dbh => ...;
    },
);

sub search {
    my ($self,$query_string) = @_;

     my $query = Data::SearchEngine::Query->new(
       count => 10,
       page => 1,
       query => $query_string,
     );

    warn "search for $query_string";

    my $results = $self->solr->search($query);

    foreach my $item (@{ $results->items }) {
        my $title = $item->get_value('ste_title');
        #utf8::encode($title);
        print "$title\n";
                warn dump $title;
    }
}

1;
