grammar PloverDictionaryTranslationOnly;


dictionary: WS? LEFT_CURLY WS? (record WS? COMMA)* WS? record? WS? RIGHT_CURLY WS? EOF;
record: QUOTE .*? QUOTE WS? COLON WS? QUOTE  translation? QUOTE;
translation: (command | string)+;

command: nothing
        | combo
        | retroInsertSpace
        | retroDeleteSpace
        | retroCapFirstWord
        | retroLowerFirstChar
        | retroToggleAsterisk
        | retroUpperFirstWord
        | repeatLastStroke
        | cancelFormatting
        | capFirstWord
        | carryingCapitalization
        | casingModes
        | currency
        | endWord
        | lookahead
        | macro
        | meta
        | lowerFirstChar
        | upperFirstWord
        | undo
        | setSpace
        | ploverCommand
        | glue
        | punctuation
        | infix
        | suffix
        | prefix
        | other
        ;

combo: LEFT_CURLY HASH key+ RIGHT_CURLY;
nothing: LEFT_CURLY HASH RIGHT_CURLY ;

key: string ('(' key* ')');

suffix: LEFT_CURLY ATTACH_CHAR string? RIGHT_CURLY
        | LEFT_CURLY ATTACH_CHAR RIGHT_CURLY string?
        | LEFT_CURLY COLON ATTACH_WORD RIGHT_CURLY string?
        | LEFT_CURLY COLON ATTACH_WORD COLON ATTACH_CHAR string? RIGHT_CURLY
        ;

prefix: LEFT_CURLY  string? ATTACH_CHAR RIGHT_CURLY
        | string? LEFT_CURLY ATTACH_CHAR RIGHT_CURLY
        | string? LEFT_CURLY COLON ATTACH_WORD RIGHT_CURLY
        | LEFT_CURLY COLON ATTACH_WORD COLON string? ATTACH_CHAR RIGHT_CURLY
;

infix: LEFT_CURLY ATTACH_CHAR string? ATTACH_CHAR RIGHT_CURLY
        | LEFT_CURLY ATTACH_CHAR RIGHT_CURLY string? LEFT_CURLY ATTACH_CHAR RIGHT_CURLY
        | LEFT_CURLY COLON ATTACH_WORD COLON string? RIGHT_CURLY
;

glue: LEFT_CURLY AMPERSAND string RIGHT_CURLY
    | LEFT_CURLY COLON GLUE COLON string? RIGHT_CURLY ;

retroInsertSpace: LEFT_CURLY STAR QUESTION_MARK RIGHT_CURLY;
retroDeleteSpace: LEFT_CURLY STAR EXCLAMATION_MARK RIGHT_CURLY;

setSpace: LEFT_CURLY SET_SPACE string? RIGHT_CURLY ;
resetSpace: LEFT_CURLY RESET_SPACE RIGHT_CURLY;
capFirstWord: LEFT_CURLY CAP_FIRST_WORD RIGHT_CURLY;
retroCapFirstWord: LEFT_CURLY RETRO_CAP_FIRST_WORD RIGHT_CURLY;
lowerFirstChar: LEFT_CURLY LOWER_FIRST_CHAR RIGHT_CURLY;
retroLowerFirstChar: LEFT_CURLY RETRO_LOWER_FIRST_CHAR RIGHT_CURLY;
upperFirstWord: LEFT_CURLY UPPER_FIRST_WORD RIGHT_CURLY;
retroUpperFirstWord: LEFT_CURLY RETRO_UPPER_FIRST_WORD RIGHT_CURLY;
carryingCapitalization: LEFT_CURLY '~|' string? RIGHT_CURLY
                      | LEFT_CURLY ATTACH_CHAR '~|' string? RIGHT_CURLY
                      | LEFT_CURLY '~|' string? ATTACH_CHAR RIGHT_CURLY
                      | LEFT_CURLY ATTACH_CHAR '~|' string? ATTACH_CHAR RIGHT_CURLY;

casingModes:  LEFT_CURLY CAPS RIGHT_CURLY
            | LEFT_CURLY TITLE RIGHT_CURLY
            | LEFT_CURLY LOWER RIGHT_CURLY
            | LEFT_CURLY CAMEL RIGHT_CURLY
            | LEFT_CURLY SNAKE RIGHT_CURLY
            | LEFT_CURLY RESET_CASE RIGHT_CURLY;
// Can strings be part of punctuation?
punctuation: LEFT_CURLY DOT RIGHT_CURLY
| LEFT_CURLY COMMA string? RIGHT_CURLY
| LEFT_CURLY QUESTION_MARK string? RIGHT_CURLY
| LEFT_CURLY EXCLAMATION_MARK string? RIGHT_CURLY
| LEFT_CURLY COLON string? RIGHT_CURLY
| LEFT_CURLY '`' string? RIGHT_CURLY
| LEFT_CURLY ';' string? RIGHT_CURLY
| LEFT_CURLY COLON 'stop' COLON string? RIGHT_CURLY
| LEFT_CURLY COLON 'comma' COLON string? RIGHT_CURLY;

undo: '=undo';

repeatLastStroke: LEFT_CURLY '*+' RIGHT_CURLY
                | '=repeat_last_stroke';

retroToggleAsterisk: LEFT_CURLY '*' RIGHT_CURLY
                | '=retro_toggle_asterisk'
                | '=retrospective_toggle_asterisk';

cancelFormatting: LEFT_CURLY RIGHT_CURLY ;


endWord: LEFT_CURLY DOLLAR RIGHT_CURLY
        | LEFT_CURLY COLON 'word_end' RIGHT_CURLY;

currency: LEFT_CURLY STAR L_PARENTHESIS string? C string? R_PARENTHESIS RIGHT_CURLY
          | LEFT_CURLY RETRO_CURRENCY string? C string? RIGHT_CURLY ;

lookahead: LEFT_CURLY EQUAL string SLASH string SLASH string RIGHT_CURLY
         | LEFT_CURLY IF_NEXT_MATCHES string SLASH string SLASH string RIGHT_CURLY ;

ploverCommand: LEFT_CURLY PLOVER string (COLON string)? RIGHT_CURLY ;

meta: LEFT_CURLY  COLON string (COLON string)? RIGHT_CURLY ;

macro: EQUAL string (COLON string)?;

other: LEFT_CURLY string RIGHT_CURLY;



WS: [ \n\r]+;
RETRO_CURRENCY: ':retro_currency:' ;
IF_NEXT_MATCHES: ':if_next_matches:';
PLOVER: 'plover:';
EQUAL: '=';
SLASH: '/';
STAR: '*';
C: 'c';
DOLLAR: '$';
L_PARENTHESIS: '(';
R_PARENTHESIS: ')';

CAPS:'mode:caps' ;
TITLE:'mode:title' ;
LOWER:'mode:lower' ;
CAMEL:'mode:camel' ;
SNAKE:'mode:snake' ;
RESET_CASE:'mode:reset_case' ;
CARRY_CAPITALIZATION: '~|';
SET_SPACE: 'mode:set_space:';
RESET_SPACE: 'mode:reset_space:' ;
CAP_FIRST_WORD: ':case:cap_first_word' | '-|';
RETRO_CAP_FIRST_WORD: ':retro_case:cap_first_word' | '*-|';
LOWER_FIRST_CHAR: ':case:lower_first_char' | '>';
RETRO_LOWER_FIRST_CHAR: ':retro_case:lower_first_char' | '*>';
UPPER_FIRST_WORD: ':case:upper_first_char' | '<';
RETRO_UPPER_FIRST_WORD: ':retro_case:upper_first_char' | '*<';


ATTACH_CHAR: '^';
BACKSLASH: '\\';
LEFT_CURLY: '{' ;
RIGHT_CURLY: '}' ;
COLON: ':';
DOT: '.';
COMMA: ',';
QUOTE: '"';
HASH: '#';

ATTACH_WORD: 'attach';
GLUE: 'glue';
AMPERSAND: '&';
QUESTION_MARK: '?';
EXCLAMATION_MARK: '!';

string: (WORD | WS)+;
WORD: ANYCHAR+;
fragment ANYCHAR: BACKSLASH BACKSLASH (LEFT_CURLY | RIGHT_CURLY)
                | BACKSLASH (QUOTE | BACKSLASH | 'n' | 't' | COLON)
                | ~["\\{}:];