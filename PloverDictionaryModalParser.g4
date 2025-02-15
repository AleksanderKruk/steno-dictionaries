grammar PloverDictionaryModalParser;

options {
        tokenVocab = PloverDictionaryModalLexer;
}

dictionary: LCURLY_JSON (record COMMA_JSON)* record? RCURLY_JSON EOF;
record: ENTER_OUTLINE outline EXIT_OUTLINE 
        COLON_JSON 
        ENTER_TRANSLATION translation? EXIT_TRANSLATION;
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

combo: ENTER_COMBO key+ EXIT_COMBO;
key: modifierKey
     | ~EXIT_COMBO;

modifierKey:
          COMBO_SHIFT_L COMBO_LPAREN key+ COMBO_RPAREN
        | COMBO_SHIFT_R COMBO_LPAREN key+ COMBO_RPAREN
        | COMBO_SHIFT COMBO_LPAREN key+ COMBO_RPAREN
        | COMBO_CONTROL_L COMBO_LPAREN key+ COMBO_RPAREN
        | COMBO_CONTROL_R COMBO_LPAREN key+ COMBO_RPAREN
        | COMBO_CONTROL COMBO_LPAREN key+ COMBO_RPAREN
        | COMBO_ALT_L COMBO_LPAREN key+ COMBO_RPAREN
        | COMBO_ALT_R COMBO_LPAREN key+ COMBO_RPAREN
        | COMBO_ALT COMBO_LPAREN key+ COMBO_RPAREN
        | COMBO_SUPER_L COMBO_LPAREN key+ COMBO_RPAREN
        | COMBO_SUPER_R COMBO_LPAREN key+ COMBO_RPAREN
        | COMBO_SUPER COMBO_LPAREN key+ COMBO_RPAREN
        | COMBO_WINDOWS COMBO_LPAREN key+ COMBO_RPAREN
        | COMBO_COMMAND COMBO_LPAREN key+ COMBO_RPAREN
        | COMBO_OPTION COMBO_LPAREN key+ COMBO_RPAREN
        | COMBO_BACKSPACE
        ;

suffix: LEFT_CURLY '^' string? RIGHT_CURLY
        | LEFT_CURLY '^' RIGHT_CURLY string?
        | LEFT_CURLY ':attach' RIGHT_CURLY string?
        | LEFT_CURLY ':attach:^' string? RIGHT_CURLY
        ;

prefix: LEFT_CURLY  string? '^' RIGHT_CURLY
        | string? LEFT_CURLY '^' RIGHT_CURLY
        | string? LEFT_CURLY ':attach' RIGHT_CURLY
        | LEFT_CURLY ':attach:' string? '^' RIGHT_CURLY
;

infix: LEFT_CURLY '^' string? '^' RIGHT_CURLY
        | LEFT_CURLY '^' RIGHT_CURLY string? LEFT_CURLY '^' RIGHT_CURLY
        | LEFT_CURLY ':attach:' string? RIGHT_CURLY
;

glue: LEFT_CURLY AMPERSAND string RIGHT_CURLY
    | LEFT_CURLY ':glue:' string? RIGHT_CURLY ;

retroInsertSpace: LEFT_CURLY '*' '?' RIGHT_CURLY;
retroDeleteSpace: LEFT_CURLY '*' '!' RIGHT_CURLY;

setSpace: LEFT_CURLY 'mode:set_space:' string? RIGHT_CURLY ;
resetSpace: LEFT_CURLY 'mode:reset_space:' RIGHT_CURLY;
capFirstWord: LEFT_CURLY '-|' RIGHT_CURLY
            | LEFT_CURLY ':case:cap_first_word' RIGHT_CURLY;
retroCapFirstWord: LEFT_CURLY '*-|' RIGHT_CURLY
            |       LEFT_CURLY ':retro_case:cap_first_word' RIGHT_CURLY;
lowerFirstChar: LEFT_CURLY '>' RIGHT_CURLY
            |   LEFT_CURLY ':case:lower_first_char' RIGHT_CURLY;
retroLowerFirstChar: LEFT_CURLY '*>' RIGHT_CURLY
                |   LEFT_CURLY ':retro_case:lower_first_char' RIGHT_CURLY;
upperFirstWord: LEFT_CURLY '<' RIGHT_CURLY
            |   LEFT_CURLY ':case:upper_first_word' RIGHT_CURLY;
retroUpperFirstWord: LEFT_CURLY '*<' RIGHT_CURLY
                |   LEFT_CURLY ':retro_case:upper_first_word' RIGHT_CURLY;
carryingCapitalization: LEFT_CURLY '~|' string? RIGHT_CURLY
                      | LEFT_CURLY '^~|' string? RIGHT_CURLY
                      | LEFT_CURLY '~|' string? '^' RIGHT_CURLY
                      | LEFT_CURLY '^~|' string? '^' RIGHT_CURLY;

casingModes: LEFT_CURLY 'mode:caps' RIGHT_CURLY
            | LEFT_CURLY 'mode:title' RIGHT_CURLY
            | LEFT_CURLY 'mode:lower' RIGHT_CURLY
            | LEFT_CURLY 'mode:camel' RIGHT_CURLY
            | LEFT_CURLY 'mode:snake' RIGHT_CURLY
            | LEFT_CURLY 'mode:reset_case' RIGHT_CURLY;

// Can strings be part of punctuation?
punctuation: LEFT_CURLY '.' RIGHT_CURLY
| LEFT_CURLY ':stop:.' RIGHT_CURLY
| LEFT_CURLY COMMA string? RIGHT_CURLY
| LEFT_CURLY ':comma:' COMMA RIGHT_CURLY
| LEFT_CURLY '?' string? RIGHT_CURLY
| LEFT_CURLY ':stop:?' RIGHT_CURLY
| LEFT_CURLY '!' string? RIGHT_CURLY
| LEFT_CURLY ':stop:!' RIGHT_CURLY
| LEFT_CURLY ':' string? RIGHT_CURLY
| LEFT_CURLY '`' string? RIGHT_CURLY
| LEFT_CURLY ':comma::' RIGHT_CURLY
| LEFT_CURLY ';' string? RIGHT_CURLY
| LEFT_CURLY ':comma:;' RIGHT_CURLY;

undo: '=undo';

repeatLastStroke: LEFT_CURLY '*+' RIGHT_CURLY
                | '=repeat_last_stroke';

retroToggleAsterisk: LEFT_CURLY '*' RIGHT_CURLY
                | '=retro_toggle_asterisk'
                | '=retrospective_toggle_asterisk';

cancelFormatting: LEFT_CURLY RIGHT_CURLY ;

nothing: LEFT_CURLY '#'RIGHT_CURLY ;

endWord: LEFT_CURLY '$'RIGHT_CURLY
        | LEFT_CURLY ':word_end' RIGHT_CURLY;

currency: LEFT_CURLY  '*' '(' string? 'c' string? ')' RIGHT_CURLY
          | LEFT_CURLY ':retro_currency:' string? 'c' string? RIGHT_CURLY ;

lookahead: LEFT_CURLY  '=' string '/' string '/' string RIGHT_CURLY
         | LEFT_CURLY ':if_next_matches:' string '/' string '/' string RIGHT_CURLY ;

ploverCommand: LEFT_CURLY 'plover:' string (COLON string)? RIGHT_CURLY ;

meta: LEFT_CURLY  COLON string (COLON string)? RIGHT_CURLY ;

macro: '=' string (COLON string)?;

pgh: LEFT_CURLY 'p''g''h' RIGHT_CURLY;
en: LEFT_CURLY 'n' RIGHT_CURLY;
lpluscommand: LEFT_CURLY 'l' '+' RIGHT_CURLY;
lminuscommand: LEFT_CURLY 'l' '-' RIGHT_CURLY;

outline: SLASH? chord (SLASH chord)*;
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



string: anychar+;
anychar:  BACKSLASH BACKSLASH ( LEFT_CURLY | RIGHT_CURLY )
        | BACKSLASH ( QUOTE | BACKSLASH | 'n' | 't' )
        | ~(QUOTE | RIGHT_CURLY | LEFT_CURLY | BACKSLASH);

