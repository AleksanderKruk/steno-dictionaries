import sys
import re
import json
import glob
import pathlib
import itertools
import operator
from typing import Iterable
import more_itertools
from collections import Counter
import os
import string
import argparse

def chord_translation(symbol_sequence: Iterable, word_to_translations: dict):
    symbols = set()
    intermediate = set()
    for symbol in symbol_sequence:
        symbols.add(symbol)
        words_and_seps = re.split(r"(::|\_)", symbol)
        if words_and_seps[0] == "":
            seps, words = words_and_seps[::2], words_and_seps[1::2]
        else:
            words, seps = words_and_seps[::2], words_and_seps[1::2]
        if all(w in word_to_translations for w in words):
            all_translations = [
                word_to_translations[w]
                for w in words
                ]
            for chord_product in itertools.product(*all_translations):
                translation = words[0]
                chords = chord_product[0]
                for word, sep, chord in zip(words[1:], seps, chord_product[1:]):
                    translation += sep + word
                    chords += "/" + chord
                    if chords not in intermediate:
                        yield chords, translation
                        intermediate.add(chords)
    return symbols, intermediate


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--output-file", type=pathlib.Path)
    arguments = parser.parse_args(sys.argv[1:])
    output_file: pathlib.Path = arguments.output_file

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
    intermediate = set()
    if output_file is not None:
        output_stream = output_file.open("w", encoding="utf-8")
    else:
        output_stream = sys.stdout
    with open("./c++/symbols/cppsymbols.txt", encoding="utf-8") as inputfh:
        output_stream.write("{\n")
        stripped_lines = (line.strip() for line in inputfh)
        chords_to_translation = list(chord_translation(stripped_lines, word_to_translations))
        for chords, translation in chords_to_translation[:-1]:
            output_stream.write(f'"{chords}": "{translation}",\n')
        chords, translation = chords_to_translation[-1]
        output_stream.write(f'"{chords}": "{translation}"\n')
        output_stream.write("}")
    output_stream.close()
