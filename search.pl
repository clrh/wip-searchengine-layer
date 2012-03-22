#!/usr/bin/perl


package main;

use lib 'lib';
use SearchEngine::Search;
my $o = SearchEngine::Search->new;
print $o->search("fort");

