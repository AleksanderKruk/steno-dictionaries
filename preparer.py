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


def load_existing_translations(*paths: Iterable[pathlib.Path]) -> dict[str, str]:
    translation_to_word = {}
    for path in paths:
        with path.open(encoding="utf-8") as dictionary_file:
            translation_to_word |= json.load(dictionary_file)
    return translation_to_word


def map_word_to_translation(translation_to_word):
    word_to_translations = dict.fromkeys(translation_to_word.values(), None)
    for word in word_to_translations:
        word_to_translations[word] = []
    for translation, word in translation_to_word.items():
        word_to_translations[word].append(translation)
    return word_to_translations


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--existing-translations", nargs="*", type=pathlib.Path)
    parser.add_argument("--symbol-files", nargs="+", type=pathlib.Path, required=True)
    parser.add_argument("--output-file", type=pathlib.Path)
    arguments = parser.parse_args(sys.argv[1:])
    existing_translations: list[pathlib.Path] = arguments.existing_translations
    symbols: list[pathlib.Path] = arguments.symbol_files
    output_file: pathlib.Path = arguments.output_file

    translation_to_word = load_existing_translations(*existing_translations)
    translation_to_word.pop("", None)
    word_to_translations = map_word_to_translation(translation_to_word)

    symbols = set()
    intermediate = set()
    if output_file is not None:
        output_stream = output_file.open("w", encoding="utf-8")
    else:
        output_stream = sys.stdout

    try:
        symbol_file_handles = [
            symbol_file.open(encoding="utf-8")
            for symbol_file in symbols
            ]
        all_lines_stripped = (line.strip()
                            for symbol_file_handle in symbol_file_handles
                            for line in symbol_file_handle)

        output_stream.write("{\n")
        chords_to_translation = list(chord_translation(all_lines_stripped, word_to_translations))
        for chords, translation in chords_to_translation[:-1]:
            output_stream.write(f'"{chords}": "{translation}",\n')
        chords, translation = chords_to_translation[-1]
        output_stream.write(f'"{chords}": "{translation}"\n')
        output_stream.write("}")

    finally:
        if not output_stream.closed:
            output_stream.close()
        for symbol_file_handle in symbol_file_handles:
            if not symbol_file_handle.closed:
                symbol_file_handle.close()

