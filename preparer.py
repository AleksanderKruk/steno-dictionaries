import sys
import re
import json
import glob
import pathlib
import itertools
import operator
import more_itertools
from collections import Counter

if __name__ == "__main__":
    translation_to_word = None
    with pathlib.Path("./main.json").open(encoding="utf-8") as dictionary_file:
        translation_to_word: dict = json.load(dictionary_file)
    with pathlib.Path("./cpp.json").open(encoding="utf-8") as dictionary_file:
        translation_to_word |= json.load(dictionary_file)
    translation_to_word.pop("", None)
    word_to_translations = dict.fromkeys(translation_to_word.values(), None)
    for t, w in translation_to_word.items():
        translations = word_to_translations[w]
        if (translations is None):
            word_to_translations[w] = [t]
        else:
            word_to_translations[w].append(t)

    symbols = set()
    with open("./c++/cppsymbols.json", "w") as writefh, \
         open("./c++/symbols/cppsymbols.txt", encoding="utf-8") as fh:
        writefh.write("{\n")
        for line in fh:
            symbol = line.strip()
            symbols.add(symbol)
            words = re.split(r"::|\_", symbol)
            if all(w in word_to_translations for w in words):
                all_translations = [
                    word_to_translations[w]
                    for w in words
                    ]
                for chord_product in itertools.product(*all_translations):
                    chords = "/".join(chord_product)
                    writefh.write(f'"{chords}": "{symbol}",\n')
        writefh.seek(writefh.tell()-3)
        writefh.write("\n}")

