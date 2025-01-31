import regex
import enum

import re
class SymbolCase(enum.Enum):
    ALL_LOWER_WITHOUT_UNDERSCORES = enum.auto()
    ALL_LOWER_WITH_UNDERSCORES = enum.auto()
    ALL_UPPER_WITHOUT_UNDERSCORES = enum.auto() 
    ALL_UPPER_WITH_UNDERSCORES = enum.auto() 
    WORD_CAPITALIZED = enum.auto() 
    WORD_CAPITALIZED_EXCEPT_FIRST = enum.auto() 


def symbol_case(symbol: str):
    if regex.fullmatch(r"[[:lower:][:digit:]]+", symbol):
        return SymbolCase.ALL_LOWER_WITHOUT_UNDERSCORES
    elif regex.fullmatch(r"[[:upper:][:digit:]]+", symbol):
        return SymbolCase.ALL_UPPER_WITHOUT_UNDERSCORES
    elif regex.fullmatch(r"[[:lower:][:digit:]_]+", symbol):
        return SymbolCase.ALL_LOWER_WITH_UNDERSCORES
    elif regex.fullmatch(r"[[:upper:][:digit:]_]+", symbol):
        return SymbolCase.ALL_UPPER_WITH_UNDERSCORES
    elif regex.fullmatch(r"[[:upper:]]", symbol[0]):
        return SymbolCase.WORD_CAPITALIZED
    else:
        return SymbolCase.WORD_CAPITALIZED_EXCEPT_FIRST

if __name__ =="__main__":
    assert symbol_case("aabbcc") == SymbolCase.ALL_LOWER_WITHOUT_UNDERSCORES, "1"
    assert symbol_case("aa_bb_cc") == SymbolCase.ALL_LOWER_WITH_UNDERSCORES, "2"
    assert symbol_case("AA_BB_CC") == SymbolCase.ALL_UPPER_WITH_UNDERSCORES, "3"
    assert symbol_case("AABBCC") == SymbolCase.ALL_UPPER_WITHOUT_UNDERSCORES, "4"
    assert symbol_case("AaBbCc") == SymbolCase.WORD_CAPITALIZED, "5"
    assert symbol_case("aaBbCc") == SymbolCase.WORD_CAPITALIZED_EXCEPT_FIRST, "6"

        
