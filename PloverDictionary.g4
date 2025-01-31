grammar PloverDictionary;
dictionary: '{' (record ',')* record? '}';
record: outline ':' translation;

outline: '"' '"';

translation: '"' '"';

combo: '#' key+;
key: normalKey 
        | modifierKey;

normalKey: '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' 
        | 'a' | 'b' | 'c' | 'd' | 'e' | 'f' | 'g' | 'h' | 'i' | 'j'
        | 'k' | 'l' | 'm' | 'n' | 'o' | 'p' | 'r' | 's' | 't' | 'u'
        | 'v' | 'w' | 'x' | 'y' | 'z'
        | 'aacute'            
        | 'acircumflex'       
        | 'acute'             
        | 'adiaeresis'        
        | 'ae'                
        | 'agrave'            
        | 'ampersand'         
        | 'apostrophe'        
        | 'aring'             
        | 'asciicircum'       
        | 'asciitilde'        
        | 'asterisk'          
        | 'at'                
        | 'atilde'            
        | 'backslash'         
        | 'bar'               
        | 'braceleft'         
        | 'braceright'        
        | 'bracketleft'       
        | 'bracketright'      
        | 'brokenbar'         
        | 'ccedilla'          
        | 'cedilla'           
        | 'cent'              
        | 'clear'             
        | 'colon'             
        | 'comma'             
        | 'copyright'         
        | 'currency'          
        | 'degree'            
        | 'diaeresis'         
        | 'division'          
        | 'dollar'            
        | 'eacute'            
        | 'ecircumflex'       
        | 'ediaeresis'        
        | 'egrave'            
        | 'equal'             
        | 'eth'               
        | 'exclam'            
        | 'exclamdown'        
        | 'grave'             
        | 'greater'           
        | 'guillemotleft'     
        | 'guillemotright'    
        | 'hyphen'            
        | 'iacute'            
        | 'icircumflex'       
        | 'idiaeresis'        
        | 'igrave'            
        | 'less'              
        | 'macron'            
        | 'masculine'         
        | 'minus'             
        | 'mu'                
        | 'multiply'          
        | 'nobreakspace'      
        | 'notsign'           
        | 'ntilde'            
        | 'numbersign'        
        | 'oacute'            
        | 'ocircumflex'       
        | 'odiaeresis'        
        | 'ograve'            
        | 'onehalf'           
        | 'onequarter'        
        | 'onesuperior'       
        | 'ooblique'          
        | 'ordfeminine'       
        | 'oslash'            
        | 'otilde'            
        | 'paragraph'         
        | 'parenleft'         
        | 'parenright'        
        | 'percent'           
        | 'period'            
        | 'periodcentered'    
        | 'plus'              
        | 'plusminus'         
        | 'question'          
        | 'questiondown'      
        | 'quotedbl'          
        | 'quoteleft'         
        | 'quoteright'        
        | 'registered'        
        | 'return'            
        | 'section'           
        | 'semicolon'         
        | 'slash'             
        | 'space'             
        | 'ssharp'            
        | 'sterling'          
        | 'tab'               
        | 'thorn'             
        | 'threequarters'     
        | 'threesuperior'     
        | 'twosuperior'       
        | 'uacute'            
        | 'ucircumflex'       
        | 'udiaeresis'        
        | 'ugrave'            
        | 'underscore'        
        | 'yacute'            
        | 'ydiaeresis'        
        | 'yen'               
        ;

modifierKey: 'Shift_L' '(' key+ ')'
        | 'Shift_R' '(' key+ ')'
        | 'shift' '(' key+ ')'
        | 'Control_L' '(' key+ ')'
        | 'Control_R' '(' key+ ')'
        | 'control' '(' key+ ')'
        | 'Alt_L' '(' key+ ')'
        | 'Alt_R' '(' key+ ')'
        | 'alt' '(' key+ ')'
        | 'Super_L' '(' key+ ')'
        | 'Super_R' '(' key+ ')'
        | 'super' '(' key+ ')'
        | 'windows' '(' key+ ')'
        | 'command' '(' key+ ')'
        | 'option' '(' key+ ')'
        ;

suffix: '{^' STRING? '}'
        | '{^}' STRING?
        | '{:attach}' STRING?
        | '{:attach:^' STRING? '}'
        ;

prefix: '{' STRING? '^}'
        | STRING? '{^}'
        | STRING? '{:attach}'
        | '{:attach:' STRING? '^}'
;

infix: '{^' STRING? '^}'
        | '{^}' STRING? '{^}'
        | '{:attach:' STRING? '}'
;

glue: '{&' '}'
    | '{:glue:' STRING? '}';

retroInsertSpace: '{*?}';
retroDeleteSpace: '{*!}';

setSpace: '{mode:set_space:' STRING? '}';
resetSpace: '{mode:reset_space:}';
capFirstWord: '{-|}'
            | '{:case:cap_first_word}';
retroCapFirstWord: '{*-|}'
            |       '{:retro_case:cap_first_word}';
lowerFirstChar: '{>}'
            |   '{:case:lower_first_char}';
retroLowerFirstChar: '{*>}'
                |   '{:retro_case:lower_first_char}';
upperFirstWord: '{<}'
            |   '{:case:upper_first_word}';
retroUpperFirstWord: '{*<}'
                |   '{:retro_case:upper_first_word}';
carryingCapitalization: '{~|' STRING? '}'
                      | '{^~|' STRING? '}'
                      | '{~|' STRING? '^}'
                      | '{^~|' STRING? '^}';

casingModes: '{mode:caps}' 
            |'{mode:title}'
            |'{mode:lower}'
            |'{mode:camel}'
            |'{mode:snake}'
            |'{mode:reset_case}';

punctuation: '{.}' 
| '{:stop:.}' 
| '{,}' 
| '{:comma:,}' 
| '{?}' 
| '{:stop:?}' 
| '{!}' 
| '{:stop:!}' 
| '{:}' 
| '{:comma::}' 
| '{;}'
| '{:comma:;}';

undo: '=undo';

repeatLastStroke: '{*+}'
                | '=repeat_last_stroke';

retroToggleAsterisk: '{*}'
                | '=retro_toggle_asterisk'
                | '=retrospective_toggle_asterisk';

cancelFormatting: '{}';

nothing: '{#}';

endWord: '{$}'
        | '{:word_end}';

currency: '{*(' STRING? 'c' STRING? ')}'
          | '{:retro_currency:' STRING? 'c' STRING? '}';

lookahead: '{=' STRING '/' STRING '/' STRING '}'
         | '{:if_next_matches:' STRING '/' STRING '/' STRING '}';

command: '{plover:' STRING (':' STRING)? '}';

meta: '{:' STRING (':' STRING)? '}';

macro: '=' STRING (':' STRING)?;

STRING: [a-zA-Z ]+;


WS: [ \n\r]+ -> skip;

