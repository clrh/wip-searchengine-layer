package SearchEngine::Solr::Index;
use Moose::Role;
with 'SearchEngine::IndexRole';

use Data::SearchEngine::Solr;
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

sub index_record {
    my ($self, @recordid) = @_;
    warn "SearchEngine::Solr->index_record"; 
}


1;
