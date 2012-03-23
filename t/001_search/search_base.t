use Test::More;
use Test::TinyMocker;
use lib 'lib';
use SearchEngine::Search;

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
