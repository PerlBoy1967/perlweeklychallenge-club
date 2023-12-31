#!/bin/perl

=pod

The Weekly Challenge - 249
- https://theweeklychallenge.org/blog/perl-weekly-challenge-249

Author: Niels 'PerlBoy' van Dijke

Task 2: DI String Match
Submitted by: Mohammad S Anwar

You are given a string s, consisting of only the characters "D" and "I".

Find a permutation of the integers [0 .. length(s)] such that for each character s[i] in the string:

s[i] == 'I' => perm[i] < perm[i + 1]
s[i] == 'D' => perm[i] > perm[i + 1]

=cut

use v5.32;
use common::sense;
use feature qw(signatures);

use Test2::V0;

sub diStringMatch ($str) {
  my @i = 0 .. length $str;
  [(map { $_ eq 'D' ? pop @i : shift @i } split //,$str),shift @i];
}

is(diStringMatch('IDID'),[0,4,1,3,2]);
is(diStringMatch('III'),[0,1,2,3]);
is(diStringMatch('DDI'),[3,2,0,1]);

done_testing;
