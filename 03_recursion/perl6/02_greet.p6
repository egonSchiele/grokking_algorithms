#!/usr/bin/env perl6
use v6.c;

sub greet2($name) {
    say "how are you, $name?";
}

sub bye() {
    say "ok bye!";
}

sub greet($name) {
    say "hello, $name!";
    greet2 $name;
    say "getting ready to say bye...";
    bye;
}

greet "adit";
