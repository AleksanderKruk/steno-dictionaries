grammar stenochords;
chords: '/'? chord ('/' chord)*;
chord: numberedChord | unnumberedChord;
numberedChord: NUM_1? NUM_2? NUM_3? NUM_4? NUM_0? NUM_5? STAR? NUM_6? NUM_7? NUM_8? NUM_9?
            | NUM_1?  NUM_2?  K? NUM_3?  NUM_4?  W?  R?
              NUM_0?  NUM_5?  STAR?  '-'?  NUM?  E?  U?
              NUM_6?  NUM_7?  NUM_8?  NUM_9?
              D?  B?  G?  S?  Z?;

unnumberedChord:
       leftSide center rightSidec
       (F | NUM_6)?
       (P | NUM_7)?
       (L | NUM_8)?
       (T | NUM_9)?
       D?  B?  G?  S?  Z?;

leftSide: S? T? K? P? W? H? R?;

rightSide: F? R? P? B? L? G? T? S? D? Z?;
center: '-'
       | A? O? STAR E? U?
       | A O? E? U?
       | O E? U?
       | E U?
       | U
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
NUM: '#';
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
