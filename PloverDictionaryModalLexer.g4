lexer grammar PloverDictionaryModalLexer;

@members{
        boolean next_outline = false;
}

LCURLY: '{';
RCURLY: '}';
COLON_JSON: ':';
COMMA_JSON: ',';
ENTER_OUTLINE: {next_outline}? '"' {next_outline = false;} -> pushMode(outlines);
ENTER_TRANSLATION: {!next_outline}? '"' {next_outline = true;} -> pushMode(translation);
IGNORED: ~'"'+ -> channel(HIDDEN);

mode outlines;
EXIT_OUTLINES: '"' -> popMode;
S: 'S';
T: 'T';
P: 'P';
H: 'H';
K: 'K';
W: 'W';
R: 'R';
A: 'A';
O: 'O';
STAR_KEY: '*';
E: 'E';
U: 'U';
F: 'F';
L: 'L';
D: 'D';
B: 'B';
G: 'G';
Z: 'Z';
NUM_0: '0';
NUM_1: '1';
NUM_2: '2';
NUM_3: '3';
NUM_4: '4';
NUM_5: '5';
NUM_6: '6';
NUM_7: '7';
NUM_8: '8';
NUM_9: '9';
DASH: '-';
HASH_KEY: '#';
CHORD_SEPARATOR: '/';

mode translation;
EXIT_TRANSLATION: '"' -> popMode;

ESCAPED_LCURLY: '\\\\{';
ESCAPED_RCURLY: '\\\\}';
ESCAPED_BACKSLASH: '\\\\';
ESCAPED_QUOTE: '\\"';
NEWLINE: '\\n';
TAB: '\\t';
ESCAPED_COLON: '\\:';
WORD_END: 'word_end';
WS: [ \n\r]+;
RETRO_CURRENCY: ':retro_currency:';
IF_NEXT_MATCHES: ':if_next_matches:';
PLOVER: 'plover:';
CAPS:'mode:caps' ;
TITLE:'mode:title' ;
LOWER:'mode:lower' ;
CAMEL:'mode:camel' ;
SNAKE:'mode:snake' ;
RESET_CASE:'mode:reset_case' ;
CARRY_CAPITALIZATION: '~|';
SET_SPACE: 'mode:set_space:';
RESET_SPACE: 'mode:reset_space:' ;
CAP_FIRST_WORD: ':case:cap_first_word' 
        | '-|';
RETRO_CAP_FIRST_WORD: ':retro_case:cap_first_word' 
        | '*-|';
LOWER_FIRST_CHAR: ':case:lower_first_char' 
        | '>';
RETRO_LOWER_FIRST_CHAR: ':retro_case:lower_first_char' 
        | '*>';
UPPER_FIRST_WORD: ':case:upper_first_char' 
        | '<';
RETRO_UPPER_FIRST_WORD: ':retro_case:upper_first_char' 
        | '*<';
REPEAT_LAST_STROKE: '=repeat_last_stroke';
REPEAT_LAST_STROKE_OPERATOR: '*+';
RETROSPECTIVE_TOGGLE_ASTERISK: '=retrospective_toggle_asterisk';
RETRO_TOGGLE_ASTERISK: '=retro_toggle_asterisk';
UNDO: '=undo';
ATTACH_WORD: 'attach';
STOP: 'stop';
GLUE: 'glue';
COMMA_WORD: 'comma';
EQUAL: '=';
SLASH: '/';
STAR: '*';
C: 'c';
DOLLAR: '$';
L_PARENTHESIS: '(';
R_PARENTHESIS: ')';
ATTACH_CHAR: '^';
BACKSLASH: '\\';
LEFT_CURLY: '{' ;
RIGHT_CURLY: '}' ;
COLON: ':';
DOT: '.';
COMMA: ',';
HASH: '#';
ACCENT: '`';
SEMICOLON: ';';
AMPERSAND: '&';
QUESTION_MARK: '?';
EXCLAMATION_MARK: '!';
WORD: ANYCHAR+;
fragment ANYCHAR: ESCAPED_LCURLY | ESCAPED_RCURLY
                | ESCAPED_QUOTE | NEWLINE | TAB | ESCAPED_BACKSLASH | ESCAPED_COLON 
                | ~["\\{}:];