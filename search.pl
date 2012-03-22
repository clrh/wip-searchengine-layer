#!/usr/bin/perl

our $foo = 42;

package SearchEngine::Search;
use Moose;

use lib 'lib';
use Moose::Util qw( apply_all_roles );

sub BUILD {
    my $self = shift;
    my $syspref = 'SOLR';
    apply_all_roles( $self, "SearchEngine::${syspref}::Search" );
    warn "# BUILD\n";
};

package main;

my $o = SearchEngine::Search->new;
print $o->search("fort");

print $foo;
