package SearchEngine::Solr::Search;
use Moose::Role;
with 'SearchEngine::SearchRole';

use Data::SearchEngine::Solr;
use Data::SearchEngine::Query;
use Data::Dump qw(dump);
use Data::Dumper;
use YAML;

has solr => (
    is => 'ro',
    lazy => 1,
    default => sub {
        Data::SearchEngine::Solr->new(
           url => 'http://localhost:8983/solr/devsolr',
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
    #warn Data::Dump::dump ($results);
    #warn Data::Dumper::Dumper ($results);
    warn YAML::Dump ($results);

    foreach my $item (@{ $results->items }) {
        my $title = $item->get_value('ste_title');
        #utf8::encode($title);
        print "$title\n";
                warn dump $title;
    }
}

sub dosmth {'bou' }

1;
