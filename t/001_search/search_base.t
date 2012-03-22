use Test::More;

use lib 'lib';
use SearchEngine::Search;
my $search_service = SearchEngine::Search->new;
isnt (scalar $search_service->search("fort"), 0, 'test search') ;

done_testing;
