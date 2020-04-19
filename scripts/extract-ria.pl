#!/usr/bin/perl

use warnings;
use strict;
use utf8;

binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");

my $reading = 0;
while(<>) {
    chomp;
    if(!$reading) {
        if(/<textarea/) {
            $reading = 1;
            next;
        } else {
            next;
        }
    } else {
        if(m!</textarea!) {
            $reading = 0;
        } elsif(/<L ([^>]*)>/) {
            print "$1\n";
        } elsif(/^<[A-Z][^>]+>/) {
            next;
        } else {
            print "$_\n";
        }
    }
}
