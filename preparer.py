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

    total_counter = Counter()

    translatable = 0
    untranslatable = 0
    symbols = set()
    for filepath in glob.glob("./c++/*txt"):
        with open(filepath, encoding="utf-8") as fh:
            for line in fh:
                line = line.strip()
                symbols.add(line)
                words = re.split(r"::|\_", line)
                total_counter.update(w for w in words if w not in word_to_translations)
                if all(w in word_to_translations for w in words):
                    translatable+=1
                    print(line + " -> " + "/".join(word_to_translations[w][0] for w in words))
                else:
                    untranslatable+=1
                    print(line + " -> " "X")
                    print("\t missing:" + ",".join(w for w in words if w not in word_to_translations))
                    # w for w in words if w not in word_to_translations
    total_counter.pop("", None)
    for e, c in total_counter.most_common():
        if c > 2: print(f"{e} -> {c}")
    v=(translatable/(untranslatable+translatable))
    print("symbole", ":", v*100)

    # with open("./c++.json", "w") as cpp:
    #     cpp.write("{\n")
    #     length = len(total_counter.most_common())
    #     for i, (e, c) in enumerate(total_counter.most_common()):
    #         cpp.write(f'"": "{e}"{"," if i != length-1 else ""}\n')
    #     cpp.write("}\n")


