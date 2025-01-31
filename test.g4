
lexer grammar test;
OPEN: '<' -> pushMode(letterwise);
STRING: [a-zA-Z]+;
WS: [ \t\n\r]+ -> skip;
mode letterwise;
A: 'A';
B: 'B';
C: 'C';
CLOSE: '>' -> popMode;
OTHER_CHAR: [a-zA-Z ];

