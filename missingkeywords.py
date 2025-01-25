import argparse
import re
import json
import glob
import pathlib
from collections import Counter
import sys
from typing import Iterable

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

def load_keywords(path: pathlib.Path):
    keywords = {}
    with path.open("r") as fh:
        file_contents = fh.read()
        keywords = set(file_contents.split())
    return keywords


if __name__ == "__main__":
    argparser = argparse.ArgumentParser()
    argparser.add_argument("--existing-translations", nargs="*")
    argparser.add_argument("--keyword-path", type=pathlib.Path)
    argparser.add_argument("--translation-path", type=pathlib.Path)
    args = argparser.parse_args(sys.argv[1:])
    translation_to_word: dict = load_existing_translations(*list(pathlib.Path(p) for p in args.existing_translations))
    translation_to_word.pop("", None)
    word_to_translations = map_word_to_translation(translation_to_word)

    keywords = load_keywords(args.keyword_path)
    missing = keywords - word_to_translations.keys()
    if args.translation_path is None:
        for missing_keyword in missing:
            print(missing_keyword)
    else:
        translation_path: pathlib.Path = args.translation_path
        with translation_path.open("w") as fh:
            fh.write("{\n")
            for missing_keyword in missing:
                fh.write(f'"": "{missing_keyword}",\n')
            fh.seek(fh.tell()-3)
            fh.write("\n}")
