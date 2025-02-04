

from itertools import product


def translate(word:str, translations:dict[str, str], suffixes:dict[str, str], prefixes:dict[str, str], infixes:dict[str, str]):
    if word in translations:
        yield (translations[word], )
        return

    potential_prefixes:list[str] = [prefix for prefix in prefixes if word.startswith(prefix)]
    for applied_prefix in potential_prefixes:
        word_without_prefix = word[len(applied_prefix):]
        prefix_translation = prefixes[applied_prefix]
        for variant in translate(word_without_prefix, translations, suffixes, prefixes, infixes):
            if variant:
                yield (prefix_translation, *variant)
        return

    potential_suffixes = [suffix for suffix in suffixes if word.endswith(suffix)]
    for applied_suffix in potential_suffixes:
        word_without_suffix = word[:len(applied_suffix)]
        suffix_translation = suffixes[applied_suffix]
        for variant in translate(word_without_suffix, translations, suffixes, prefixes, infixes):
            if variant:
                yield (*variant, suffix_translation)
        if word_without_suffix[-1] == word_without_suffix[-2]:
            word_without_suffix = word_without_suffix[:-1]
            for variant in translate(word_without_suffix, translations, suffixes, prefixes, infixes):
                if variant:
                    yield (*variant, suffix_translation)

word = "remake"

translations = {
    "make": ["A", "B"]
}
prefixes = {
    "re": ["C", "D"]
}

for variant in translate(word, translations, {}, prefixes, {}):
    for x in product(*variant):
        print(x)



