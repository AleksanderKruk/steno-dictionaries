function max_length(elements, returned, max_e, max_v, value_v) {
    max_v = -1
    value_v = -2
    max_e = ""
    for (e in elements) {
        value_v = length(e)
        if (max_v < value_v) {
            max_v = value_v
            max_e = e
        }
    }
    returned[0] = max_e
    returned[1] = max_v
}

BEGIN {
}

length($0) != 0 {
    # symbols[$0]
    split($0, bynamespace, /::/)
    # split($0, results, /::|_/)
    # for (r in results) {
    #     words[results[r]]++
    # }
    if (length(bynamespace) != 1) {
        combined = bynamespace[1] "::" bynamespace[length(bynamespace)]
        first_and_last[combined, $0]

    }
}

END {
    asort(words, counts_ascending)
    max_length(symbols, max_symbol_length_pair)
    max_length(words, max_word_length_pair)
    print "Symbol count: " length(symbols)
    print "Word count: " length(words)
    max_length_v = max_word_length_pair[1]
    print "Longest symbol: " max_symbol_length_pair[1] "<-" max_symbol_length_pair[0]
    print "Longest word: " max_word_length_pair[1] "<-" max_word_length_pair[0]
    # two columns, first left justified with desired width
    column_specifier = sprintf("%%-%us%%s\n", max_length_v + 2)
    printf column_specifier, "Word", "Count"
    for (i = length(counts_ascending); i > 0; i--) {
        count = counts_ascending[i]
        if (count in visited_counts)
            continue
        else
            visited_counts[count]
        for (w in words) {
            if (words[w] == count) {
                printf column_specifier, w, count
            }
        }
    }
    # for (shorts in first_and_last) {
    #     split(shorts, vals, SUBSEP)
    #     if (vals[1] == prev) {
    #         print vals[1] " to samo dla " prevsym " i " vals[2]

    #     } else {
    #         print vals[1] " i " vals[2]
    #     }
    #     prev = vals[1]
    #     prevsym = vals[2]
    # }
}

