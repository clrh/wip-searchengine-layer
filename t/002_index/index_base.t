use Test::More;

use lib 'lib';
use SearchEngine::Index;
my $index_service = SearchEngine::Index->new;
is ($index_service->index_record(1), 1, 'test search') ;

done_testing;
