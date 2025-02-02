grammar PloverDictionary;


dictionary: LEFT_CURLY (record COMMA)* record? RIGHT_CURLY EOF;
record: QUOTE outline QUOTE COLON QUOTE translation? QUOTE;
translation: (command | string)+;

command: combo
        | suffix
        | prefix
        | infix
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
        | pgh
        | en
        | lminuscommand
        | lpluscommand
        ;

combo: LEFT_CURLY '#' key+ RIGHT_CURLY;
key: normalKey
     | modifierKey;

normalKey: '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9'
        | 'a' | 'b' | 'c' | 'd' | 'e' | 'f' | 'g' | 'h' | 'i' | 'j'
        | 'k' | 'l' | 'm' | 'n' | 'o' | 'p' | 'r' | 's' | 't' | 'u'
        | 'v' | 'w' | 'x' | 'y' | 'z'
        | 'a''a''c''u''t''e'
        | 'a''c''i''r''c''u''m''f''l''e''x'
        | 'a''c''u''t''e'
        | 'a''d''i''a''e''r''e''s''i''s'
        | 'a''e'
        | 'a''g''r''a''v''e'
        | 'a''m''p''e''r''s''a''n''d'
        | 'a''p''o''s''t''r''o''p''h''e'
        | 'a''r''i''n''g'
        | 'a''s''c''i''i''c''i''r''c''u''m'
        | 'a''s''c''i''i''t''i''l''d''e'
        | 'a''s''t''e''r''i''s''k'
        | 'a''t'
        | 'a''t''i''l''d''e'
        | 'b''a''c''k''s''l''a''s''h'
        | 'b''a''r'
        | 'b''r''a''c''e''l''e''f''t'
        | 'b''r''a''c''e''r''i''g''h''t'
        | 'b''r''a''c''k''e''t''l''e''f''t'
        | 'b''r''a''c''k''e''t''r''i''g''h''t'
        | 'b''r''o''k''e''n''b''a''r'
        | 'c''c''e''d''i''l''l''a'
        | 'c''e''d''i''l''l''a'
        | 'c''e''n''t'
        | 'c''l''e''a''r'
        | 'c''o''l''o''n'
        | 'c''o''m''m''a'
        | 'c''o''p''y''r''i''g''h''t'
        | 'c''u''r''r''e''n''c''y'
        | 'd''e''g''r''e''e'
        | 'd''i''a''e''r''e''s''i''s'
        | 'd''i''v''i''s''i''o''n'
        | 'd''o''l''l''a''r'
        | 'e''a''c''u''t''e'
        | 'e''c''i''r''c''u''m''f''l''e''x'
        | 'e''d''i''a''e''r''e''s''i''s'
        | 'e''g''r''a''v''e'
        | 'e''q''u''a''l'
        | 'e''t''h'
        | 'e''x''c''l''a''m'
        | 'e''x''c''l''a''m''d''o''w''n'
        | 'g''r''a''v''e'
        | 'g''r''e''a''t''e''r'
        | 'g''u''i''l''l''e''m''o''t''l''e''f''t'
        | 'g''u''i''l''l''e''m''o''t''r''i''g''h''t'
        | 'h''y''p''h''e''n'
        | 'i''a''c''u''t''e'
        | 'i''c''i''r''c''u''m''f''l''e''x'
        | 'i''d''i''a''e''r''e''s''i''s'
        | 'i''g''r''a''v''e'
        | 'l''e''s''s'
        | 'm''a''c''r''o''n'
        | 'm''a''s''c''u''l''i''n''e'
        | 'm''i''n''u''s'
        | 'm''u'
        | 'm''u''l''t''i''p''l''y'
        | 'n''o''b''r''e''a''k''s''p''a''c''e'
        | 'n''o''t''s''i''g''n'
        | 'n''t''i''l''d''e'
        | 'n''u''m''b''e''r''s''i''g''n'
        | 'o''a''c''u''t''e'
        | 'o''c''i''r''c''u''m''f''l''e''x'
        | 'o''d''i''a''e''r''e''s''i''s'
        | 'o''g''r''a''v''e'
        | 'o''n''e''h''a''l''f'
        | 'o''n''e''q''u''a''r''t''e''r'
        | 'o''n''e''s''u''p''e''r''i''o''r'
        | 'o''o''b''l''i''q''u''e'
        | 'o''r''d''f''e''m''i''n''i''n''e'
        | 'o''s''l''a''s''h'
        | 'o''t''i''l''d''e'
        | 'p''a''r''a''g''r''a''p''h'
        | 'p''a''r''e''n''l''e''f''t'
        | 'p''a''r''e''n''r''i''g''h''t'
        | 'p''e''r''c''e''n''t'
        | 'p''e''r''i''o''d'
        | 'p''e''r''i''o''d''c''e''n''t''e''r''e''d'
        | 'p''l''u''s'
        | 'p''l''u''s''m''i''n''u''s'
        | 'q''u''e''s''t''i''o''n'
        | 'q''u''e''s''t''i''o''n''d''o''w''n'
        | 'q''u''o''t''e''d''b''l'
        | 'q''u''o''t''e''l''e''f''t'
        | 'q''u''o''t''e''r''i''g''h''t'
        | 'r''e''g''i''s''t''e''r''e''d'
        | 'r''e''t''u''r''n'
        | 's''e''c''t''i''o''n'
        | 's''e''m''i''c''o''l''o''n'
        | 's''l''a''s''h'
        | 's''p''a''c''e'
        | 's''s''h''a''r''p'
        | 's''t''e''r''l''i''n''g'
        | 't''a''b'
        | 't''h''o''r''n'
        | 't''h''r''e''e''q''u''a''r''t''e''r''s'
        | 't''h''r''e''e''s''u''p''e''r''i''o''r'
        | 't''w''o''s''u''p''e''r''i''o''r'
        | 'u''a''c''u''t''e'
        | 'u''c''i''r''c''u''m''f''l''e''x'
        | 'u''d''i''a''e''r''e''s''i''s'
        | 'u''g''r''a''v''e'
        | 'u''n''d''e''r''s''c''o''r''e'
        | 'y''a''c''u''t''e'
        | 'y''d''i''a''e''r''e''s''i''s'
        | 'y''e''n'
        ;

modifierKey:
        'S''h''i''f''t''_''L' '(' key+ ')'
        | 'S''h''i''f''t''_''R' '(' key+ ')'
        | 's''h''i''f''t' '(' key+ ')'
        | 'C''o''n''t''r''o''l''_''L' '(' key+ ')'
        | 'C''o''n''t''r''o''l''_''R' '(' key+ ')'
        | 'c''o''n''t''r''o''l' '(' key+ ')'
        | 'A''l''t''_''L' '(' key+ ')'
        | 'A''l''t''_''R' '(' key+ ')'
        | 'a''l''t' '(' key+ ')'
        | 'S''u''p''e''r''_''L' '(' key+ ')'
        | 'S''u''p''e''r''_''R' '(' key+ ')'
        | 's''u''p''e''r' '(' key+ ')'
        | 'w''i''n''d''o''w''s' '(' key+ ')'
        | 'c''o''m''m''a''n''d' '(' key+ ')'
        | 'o''p''t''i''o''n' '(' key+ ')'
        | 'B''a''c''k''S''p''a''c''e'
        ;

suffix: LEFT_CURLY '^' string? RIGHT_CURLY
        | LEFT_CURLY '^' RIGHT_CURLY string?
        | LEFT_CURLY ':''a''t''t''a''c''h' RIGHT_CURLY string?
        | LEFT_CURLY ':''a''t''t''a''c''h'':''^' string? RIGHT_CURLY
        ;

prefix: LEFT_CURLY  string? '^' RIGHT_CURLY
        | string? LEFT_CURLY '^' RIGHT_CURLY
        | string? LEFT_CURLY ':attach' RIGHT_CURLY
        | LEFT_CURLY ':attach:' string? '^' RIGHT_CURLY
;

infix: LEFT_CURLY '^' string? '^' RIGHT_CURLY
        | LEFT_CURLY '^' RIGHT_CURLY string? LEFT_CURLY '^' RIGHT_CURLY
        | LEFT_CURLY ':''a''t''t''a''c''h'':' string? RIGHT_CURLY
;

glue: LEFT_CURLY AMPERSAND string RIGHT_CURLY
    | LEFT_CURLY ':''g''l''u''e'':' string? RIGHT_CURLY ;

retroInsertSpace: LEFT_CURLY '*' '?' RIGHT_CURLY;
retroDeleteSpace: LEFT_CURLY '*' '!' RIGHT_CURLY;

setSpace: LEFT_CURLY 'm''o''d''e'':''s''e''t''_''s''p''a''c''e'':' string? RIGHT_CURLY ;
resetSpace: LEFT_CURLY 'm''o''d''e'':''r''e''s''e''t''_''s''p''a''c''e'':' RIGHT_CURLY;
capFirstWord: LEFT_CURLY '-|' RIGHT_CURLY
            | LEFT_CURLY ':''c''a''s''e'':''c''a''p''_''f''i''r''s''t''_''w''o''r''d' RIGHT_CURLY;
retroCapFirstWord: LEFT_CURLY '*-|' RIGHT_CURLY
            |       LEFT_CURLY ':''r''e''t''r''o''_''c''a''s''e'':''c''a''p''_''f''i''r''s''t''_''w''o''r''d' RIGHT_CURLY;
lowerFirstChar: LEFT_CURLY '>' RIGHT_CURLY
            |   LEFT_CURLY ':''c''a''s''e'':''l''o''w''e''r''_''f''i''r''s''t''_''c''h''a''r' RIGHT_CURLY;
retroLowerFirstChar: LEFT_CURLY '*>' RIGHT_CURLY
                |   LEFT_CURLY ':''r''e''t''r''o''_''c''a''s''e'':''l''o''w''e''r''_''f''i''r''s''t''_''c''h''a''r' RIGHT_CURLY;
upperFirstWord: LEFT_CURLY '<' RIGHT_CURLY
            |   LEFT_CURLY ':''c''a''s''e'':''u''p''p''e''r''_''f''i''r''s''t''_''w''o''r''d' RIGHT_CURLY;
retroUpperFirstWord: LEFT_CURLY '*<' RIGHT_CURLY
                |   LEFT_CURLY ':''r''e''t''r''o''_''c''a''s''e'':''u''p''p''e''r''_''f''i''r''s''t''_''w''o''r''d' RIGHT_CURLY;
carryingCapitalization: LEFT_CURLY '~|' string? RIGHT_CURLY
                      | LEFT_CURLY '^~|' string? RIGHT_CURLY
                      | LEFT_CURLY '~|' string? '^' RIGHT_CURLY
                      | LEFT_CURLY '^~|' string? '^' RIGHT_CURLY;

casingModes:  LEFT_CURLY 'm''o''d''e'':''c''a''p''s' RIGHT_CURLY
            | LEFT_CURLY 'm''o''d''e'':''t''i''t''l''e' RIGHT_CURLY
            | LEFT_CURLY 'm''o''d''e'':''l''o''w''e''r' RIGHT_CURLY
            | LEFT_CURLY 'm''o''d''e'':''c''a''m''e''l' RIGHT_CURLY
            | LEFT_CURLY 'm''o''d''e'':''s''n''a''k''e' RIGHT_CURLY
            | LEFT_CURLY 'm''o''d''e'':''r''e''s''e''t''_''c''a''s''e' RIGHT_CURLY;

// Can strings be part of punctuation?
punctuation: LEFT_CURLY '.' RIGHT_CURLY
| LEFT_CURLY ':''s''t''o''p'':''.' RIGHT_CURLY
| LEFT_CURLY COMMA string? RIGHT_CURLY
| LEFT_CURLY ':''c''o''m''m''a'':' COMMA RIGHT_CURLY
| LEFT_CURLY '?' string? RIGHT_CURLY
| LEFT_CURLY ':''s''t''o''p'':''?' RIGHT_CURLY
| LEFT_CURLY '!' string? RIGHT_CURLY
| LEFT_CURLY ':''s''t''o''p'':''!' RIGHT_CURLY
| LEFT_CURLY ':' string? RIGHT_CURLY
| LEFT_CURLY '`' string? RIGHT_CURLY
| LEFT_CURLY ':''c''o''m''m''a'':'':' RIGHT_CURLY
| LEFT_CURLY ';' string? RIGHT_CURLY
| LEFT_CURLY ':''c''o''m''m''a'':'';' RIGHT_CURLY;

undo: '=''u''n''d''o';

repeatLastStroke: LEFT_CURLY '*''+' RIGHT_CURLY
                | '=''r''e''p''e''a''t''_''l''a''s''t''_''s''t''r''o''k''e';

retroToggleAsterisk: LEFT_CURLY '*' RIGHT_CURLY
                | '=''r''e''t''r''o''_''t''o''g''g''l''e''_''a''s''t''e''r''i''s''k'
                | '=''r''e''t''r''o''s''p''e''c''t''i''v''e''_''t''o''g''g''l''e''_''a''s''t''e''r''i''s''k';

cancelFormatting: LEFT_CURLY RIGHT_CURLY ;

nothing: LEFT_CURLY '#'RIGHT_CURLY ;

endWord: LEFT_CURLY '$'RIGHT_CURLY
        | LEFT_CURLY ':''w''o''r''d''_''e''n''d' RIGHT_CURLY;

currency: LEFT_CURLY  '*' '(' string? 'c' string? ')' RIGHT_CURLY
          | LEFT_CURLY ':''r''e''t''r''o''_''c''u''r''r''e''n''c''y'':' string? 'c' string? RIGHT_CURLY ;

lookahead: LEFT_CURLY  '=' string '/' string '/' string RIGHT_CURLY
         | LEFT_CURLY ':''i''f''_''n''e''x''t''_''m''a''t''c''h''e''s'':' string '/' string '/' string RIGHT_CURLY ;

ploverCommand: LEFT_CURLY 'p''l''o''v''e''r'':' string (COLON string)? RIGHT_CURLY ;

meta: LEFT_CURLY  COLON string (COLON string)? RIGHT_CURLY ;

macro: '=' string (COLON string)?;

pgh: LEFT_CURLY 'p''g''h' RIGHT_CURLY;
en: LEFT_CURLY 'n' RIGHT_CURLY;
lpluscommand: LEFT_CURLY 'l' '+' RIGHT_CURLY;
lminuscommand: LEFT_CURLY 'l' '-' RIGHT_CURLY;

outline: '/'? chord ('/' chord)*;
chord: unnumberedChord
    | numberedChord;

unnumberedChord: S? T? K? P? W? H? R? A? O? STAR E? U? F? R? P? B? L? G? T? S? D? Z?
                | S? T? K? P? W? H? R? A O? E? U? F? R? P? B? L? G? T? S? D? Z?
                | S? T? K? P? W? H? R? A? O E? U? F? R? P? B? L? G? T? S? D? Z?
                | S? T? K? P? W? H? R? A? O? E U? F? R? P? B? L? G? T? S? D? Z?
                | S? T? K? P? W? H? R? A? O? E? U F? R? P? B? L? G? T? S? D? Z?
                | S? T? K? P? W? H? R?
                | S T? K? P? W? H? R? DASH F? R? P? B? L? G? T? S? D? Z?
                | T K? P? W? H? R? DASH F? R? P? B? L? G? T? S? D? Z?
                | K P? W? H? R? DASH F? R? P? B? L? G? T? S? D? Z?
                | P W? H? R? DASH F? R? P? B? L? G? T? S? D? Z?
                | W H? R? DASH F? R? P? B? L? G? T? S? D? Z?
                | H R? DASH F? R? P? B? L? G? T? S? D? Z?
                | R DASH F? R? P? B? L? G? T? S? D? Z?
                | DASH F? R? P? B? L? G? T? S? D? Z?
                | DASH F R? P? B? L? G? T? S? D? Z?
                | DASH R P? B? L? G? T? S? D? Z?
                | DASH P B? L? G? T? S? D? Z?
                | DASH B L? G? T? S? D? Z?
                | DASH L G? T? S? D? Z?
                | DASH G T? S? D? Z?
                | DASH T S? D? Z?
                | DASH S D? Z?
                | DASH D Z?
                | DASH Z
                ;

        // Starred
numberedChord: NUM_1? NUM_2? K? NUM_3? W? NUM_4? R? NUM_5? NUM_0? STAR E? U? NUM_6? R? NUM_7? B? NUM_8? G? NUM_9? S? D? Z?
        // With one of '50EU'
             |  NUM_1? NUM_2? K? NUM_3? W? NUM_4? R? NUM_5 NUM_0? E? U? NUM_6? R? NUM_7? B? NUM_8? G? NUM_9? S? D? Z?
             |  NUM_1? NUM_2? K? NUM_3? W? NUM_4? R? NUM_5? NUM_0 E? U? NUM_6? R? NUM_7? B? NUM_8? G? NUM_9? S? D? Z?
             |  NUM_1? NUM_2? K? NUM_3? W? NUM_4? R? E U? NUM_6? R? NUM_7? B? NUM_8? G? NUM_9? S? D? Z?
             |  NUM_1? NUM_2? K? NUM_3? W? NUM_4? R? E? U NUM_6? R? NUM_7? B? NUM_8? G? NUM_9? S? D? Z?
        // Without '50EU'
             |  NUM_1 NUM_2? K? NUM_3? W? NUM_4? R? DASH? NUM_6? R? NUM_7? B? NUM_8? G? NUM_9? S? D? Z?
             |  NUM_1? NUM_2 K? NUM_3? W? NUM_4? R? DASH? NUM_6? R? NUM_7? B? NUM_8? G? NUM_9? S? D? Z?
             |  NUM_1? NUM_2? K? NUM_3 W? NUM_4? R? DASH? NUM_6? R? NUM_7? B? NUM_8? G? NUM_9? S? D? Z?
             |  NUM_1? NUM_2? K? NUM_3? W? NUM_4 R? DASH? NUM_6? R? NUM_7? B? NUM_8? G? NUM_9? S? D? Z?
             |  NUM_1? NUM_2? K? NUM_3? W? NUM_4? R? DASH? NUM_6 R? NUM_7? B? NUM_8? G? NUM_9? S? D? Z?
             |  NUM_1? NUM_2? K? NUM_3? W? NUM_4? R? DASH? NUM_6? R? NUM_7 B? NUM_8? G? NUM_9? S? D? Z?
             |  NUM_1? NUM_2? K? NUM_3? W? NUM_4? R? DASH? NUM_6? R? NUM_7? B? NUM_8 G? NUM_9? S? D? Z?
             |  NUM_1? NUM_2? K? NUM_3? W? NUM_4? R? DASH? NUM_6? R? NUM_7? B? NUM_8? G? NUM_9 S? D? Z?
             |  NUM_1? NUM_2? K? NUM_3? W? NUM_4? R? DASH? NUM_6? R? NUM_7? B? NUM_8? G? NUM_9 S? D? Z?
        // Without numbers
            | HASH K? W? R? DASH? E? U? R? B? G? S? D? Z?
            | HASH K? W? R? STAR? E? U? R? B? G? S? D? Z?
            ;

S: 'S';
T: 'T';
P: 'P';
H: 'H';
K: 'K';
W: 'W';
R: 'R';
A: 'A';
O: 'O';
STAR: '*';
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




string: anychar+;
anychar:  BACKSLASH BACKSLASH ( LEFT_CURLY | RIGHT_CURLY )
        | BACKSLASH ( QUOTE | BACKSLASH | 'n' | 't' )
        | ~(QUOTE | RIGHT_CURLY | LEFT_CURLY | BACKSLASH);

BACKSLASH: '\\';
DASH: '-';
LEFT_CURLY: '{' ;
RIGHT_CURLY: '}' ;
COLON: ':';
DOT: '.';
COMMA: ',';
QUOTE: '"';
HASH: '#';
AMPERSAND: '&';
WS: [ \n\r]+ -> skip;
CHAR: .;

