#!/bin/perl

=pod

The Weekly Challenge - 235
- https://theweeklychallenge.org/blog/perl-weekly-challenge-235

Author: Niels 'PerlBoy' van Dijke

Task 1: Remove One
Submitted by: Mohammad S Anwar

You are given an array of integers.

Write a script to find out if removing ONLY one integer makes it strictly increasing order.

=cut

use v5.16;

use common::sense;

use Test::More;

use List::MoreUtils qw(slide);

sub removeOne (@) {
  for my $n (1,2) {
    # Find delta < 0
    my @d = slide { $b - $a } @_;

    # Find indexes of delta < 0
    my $i = -1;
    my @n = map { $i++; $_ < 0 ? ($i) : () } @d;

    # Return if too many violator(s) in iteration
    return 0 if (scalar(@n) > 1 or ($n == 2 and scalar(@n) > 0));

    # Remove the violating item 
    splice(@_,$n[0],1);
  }

  return 1;
}

is(removeOne(0, 2, 9, 4, 6), 1);
is(removeOne(5, 1, 3, 2), 0);
is(removeOne(2, 2, 3), 1);
is(removeOne(1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3), 0);

done_testing;

