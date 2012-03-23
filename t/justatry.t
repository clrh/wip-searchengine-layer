package Just::A::Try;
sub yo { 'yo!' }

package Just::Another::Try;
use Moose;
has yo (
);
sub yopla { 
sub yo { 'yo!' }

use Test::More;
use Test::TinyMocker;
use Just::A::Try;

#mock 'Data::SearchEngine::Solr->search'
mock 'SearchEngine::Search->new'
    => should {
        return load_mock ("t/mocks/Data-SearchEngine-Solr-search");
    };

sub load_mock {
    my $filename = shift;
    return YAML::LoadFile $filename;
}


my $search_service = SearchEngine::Search->new;
#isnt (scalar $search_service->search("bzzzzz"), 0, 'test search') ;
warn $search_service;

done_testing;
