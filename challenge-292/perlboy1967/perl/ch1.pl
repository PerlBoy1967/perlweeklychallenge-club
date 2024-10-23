#!/bin/perl

=pod

L<https://theweeklychallenge.org/blog/perl-weekly-challenge-292#TASK1>

Author: Niels 'PerlBoy' van Dijke

Task 1: Twice Largest
Submitted by: Mohammad Sajid Anwar

You are given an array of integers, @ints, where the largest integer is unique.

Write a script to find whether the largest element in the array is at least twice
as big as every element in the given array. If it is return the index of the
largest element or return -1 otherwise.

=cut

use v5.32;
use feature qw(signatures);
no warnings qw(experimental::signatures);
use common::sense;

use Test2::V0 qw(-no_srand);

use List::MoreUtils qw(uniq indexes);

sub twiceLargest (@ints) {
  my @i = sort { $b <=> $a } uniq @ints;
  $i[0] < $i[1] * 2 ? [-1] : [indexes { $_ == $i[0] } @ints];
}

is(twiceLargest(2,4,1,0),[1], 'Example 1');
is(twiceLargest(1,2,3,4),[-1],'Example 2');
is(twiceLargest(1,2,4,4),[2,3],'Own test');

done_testing;
