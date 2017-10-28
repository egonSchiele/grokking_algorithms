<?php

$voted = [];

function check_voter($name)
{
    global $voted;
    if (isset($voted[$name])) {
        print "kick them out!\n";
    } else {
        $voted[$name] = true;
        print "let them vote!\n";
    }
}

check_voter("tom"); // let them vote!
check_voter("mike"); // let them vote!
check_voter("mike"); // kick them out!
