
lexer grammar test;
@members {
    self.first = True;
    self.ignoring = True;
}


OPEN_STENO: {self.first}?  '"'  {self.ignoring=False;} -> pushMode(steno);
OPEN_TRANSLATION: {not self.first}? '"' {self.ignoring=False;} -> pushMode(translation);
IGNORED: {self.ignoring}? (~'"')+ -> channel(HIDDEN);
WS: [ \t\n\r]+ -> channel(HIDDEN);
mode steno;
EXIT_STENO: '"' {self.first=False; self.ignoring=True;} -> popMode;
STENO_STRING: (~'"')+;

mode translation;
EXIT_TRANSLATION: '"' {self.first=True; self.ignoring=True;}-> popMode;
TRANSLATION_STRING: (~'"')+;

