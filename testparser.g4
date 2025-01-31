parser grammar testparser;
options {
    tokenVocab = test;
}

program: (STRING | OPEN .*? CLOSE)* EOF;


