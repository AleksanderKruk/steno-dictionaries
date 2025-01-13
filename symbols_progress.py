import sys
import re
import json
import glob
import pathlib
import itertools
import operator
import more_itertools
from collections import Counter
from typing import Iterable

def load_existing_translations(paths: Iterable[pathlib.Path]):
    translation_to_word = {}
    for path in paths:
        with path.open(encoding="utf-8") as dictionary_file:
            translation_to_word |= json.load(dictionary_file)
    return translation_to_word



if __name__ == "__main__":
    translation_to_word = load_existing_translations(pathlib.Path("./main.json"), 
                                                     pathlib.Path("./cpp.json"))
    translation_to_word.pop("", None)
    word_to_translations = dict.fromkeys(translation_to_word.values(), None)
    for t, w in translation_to_word.items():
        translations = word_to_translations[w]
        if (translations is None):
            word_to_translations[w] = [t]
        else:
            word_to_translations[w].append(t)

    total_counter = Counter()

    translatable = 0
    untranslatable = 0
    symbols = set()
    all_words = set()
    for filepath in glob.glob("./c++/*txt"):
        with open(filepath, encoding="utf-8") as fh:
            for line in fh:
                line = line.strip()
                symbols.add(line)
                words = re.split(r"::|\_", line)
                total_counter.update(w for w in words if w not in word_to_translations)
                if all(w in word_to_translations for w in words):
                    translatable += 1
                else:
                    untranslatable += 1
                for w in words: 
                    all_words.add(w)
    total_counter.pop("", None)
    v = translatable/(untranslatable+translatable)
    print("symbole: ", v*100, "%")

    # with open("./c++.json", "w") as cpp:
    #     cpp.write("{\n")
    #     length = len(total_counter.most_common())
    #     for i, (e, c) in enumerate(total_counter.most_common()):
    #         cpp.write(f'"": "{e}"{"," if i != length-1 else ""}\n')
    #     cpp.write("}\n")


