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

def load_existing_translations(*paths: Iterable[pathlib.Path]) -> dict[str, str]:
    translation_to_word = {}
    for path in paths:
        with path.open(encoding="utf-8") as dictionary_file:
            translation_to_word |= json.load(dictionary_file)
    return translation_to_word



if __name__ == "__main__":
    translation_to_word: dict = load_existing_translations(pathlib.Path("./main.json"), 
                                                           pathlib.Path("./cpp.json"))
    translation_to_word.pop("", None)
    word_to_translations: dict[str, list[str]] = dict.fromkeys(translation_to_word.values())
    for word in word_to_translations:
        word_to_translations[word] = []
    for translation, word in translation_to_word.items():
        translations = word_to_translations[word]
        word_to_translations[word].append(translation)

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
                for word in words: 
                    all_words.add(word)
    total_counter.pop("", None)
    untranslatable_words = {w for w in all_words if w not in word_to_translations}
    symbol_percentage = (translatable/(untranslatable+translatable)) * 100
    word_percentage = (len(untranslatable_words)/len(all_words) )*100
    print(f"symbole: {symbol_percentage}%")
    print(f"słowa: {word_percentage}%")

    # with open("./c++.json", "w") as cpp:
    #     cpp.write("{\n")
    #     length = len(total_counter.most_common())
    #     for i, (e, c) in enumerate(total_counter.most_common()):
    #         cpp.write(f'"": "{e}"{"," if i != length-1 else ""}\n')
    #     cpp.write("}\n")


