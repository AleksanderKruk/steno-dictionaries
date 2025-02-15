parser grammar testparser;
options {
    tokenVocab = test;
}

dictionary: OPEN_STENO STENO_STRING EXIT_STENO OPEN_TRANSLATION TRANSLATION_STRING EXIT_TRANSLATION;


