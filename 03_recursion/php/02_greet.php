<?php

function greet2($name)
{
    echo 'how are you, ' . $name . '?';
}

function bye()
{
    echo 'ok bye!';
}

function greet($name)
{
    echo 'hello, ' . $name . '!';
    greet2($name);
    echo  'getting ready to say bye...';
    bye();
}

greet('adit');
