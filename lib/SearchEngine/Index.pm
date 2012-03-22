package SearchEngine::Index;
use Moose;

use Moose::Util qw( apply_all_roles );

sub BUILD {
    my $self = shift;
    my $syspref = 'Solr';
    apply_all_roles( $self, "SearchEngine::${syspref}::Index" );
    warn "# BUILD\n";
};
1;
