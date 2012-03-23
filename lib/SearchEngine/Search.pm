package SearchEngine::Search;
use Moose;

use Moose::Util qw( apply_all_roles );

sub BUILD {
    my $self = shift;
    my $syspref = 'Solr'; # check SearchEngine syspref in Koha style...
    apply_all_roles( $self, "SearchEngine::${syspref}::Search" );
    warn "# BUILD\n";
};
1;
