#!/usr/bin/perl -w
# Simple script for stripping quantum-octave specific comments.
# Usage: uncomment.pl file_name 
# Author: Jarek Miszczak
# Last modyfication: 22 March 2004

use strict;
use warnings;

if ($#ARGV != 0) {
	&usage();
} else {
	my $name = $ARGV[0];
	open (FILE, "$name") or die "Can't open file!: $name";
	
	foreach(<FILE>) {
		if ($_ =~ m/#\*/) {
			# ignore this line
		} else {
			# print line without #* commnet
			print $_;
		}
	}
}

sub usage() {
	print ("Usage: uncomment.pl file_name\n");
	die ("Wrong number of arguments!");
}
