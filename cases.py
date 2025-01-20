from itertools import *

if __name__ == "__main__":
    inters = {"_", "__", "", "-"}
    words = {"Aa", "AA", "aa"}
    # primary cases are the ones consisting of one type of separator and one type of wording
    # e.g. AAAAAA, aa_aa_aa, Aa-Aa-Aa
    case_parts = inters, words, inters, words, inters, words, inters
    two_unique_elements = lambda x: len(set(x)) == 2
    no_prefix_and_suffix = lambda x: "" == x[0] == x[-1]
    is_primary = lambda x: two_unique_elements(x) and no_prefix_and_suffix(x)
    primary = filter(is_primary, product(*case_parts))
    for e in primary:
        print("".join(e))
    three_unique_elements = lambda x: len(set(x)) == 3
    is_secondary = lambda x: no_prefix_and_suffix(x) and three_unique_elements()
    secondary = filter(is_secondary, product(*case_parts))
    print("@"*50)
    for e in secondary:
        print("".join(e))



