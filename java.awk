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


/^[A-Za-z_0-9\<\>\.?]+(\(.*\))? - / && /([A-Za-z0-9]_)+(\(.*\))?/ {
}

/^[A-Za-z_0-9\<\>\.?]+(\(.*\))? - / {
    split($0, splitbydash, / - /)
    if (length(splitbydash) != 2) {
        next
    }
    symbol = splitbydash[1]
    gsub(/\(.*\)|\s+|<.*>/, "", symbol)
    symbols[symbol]
    split(symbol, splitByDot, /\./)
    for (r in splitByDot) {
        split(splitByDot[r], subwords, /[[:upper:]]/, uppercaseLetters)
        for (i=1; i<=length(uppercaseLetters); i++) {
            subword = subwords[i+1]
            letter = uppercaseLetters[i]
            subwords[i+1] =  letter subword
            all_subwords[tolower(letter) subword]
        }
    }
    for (r in splitByDot) {
        words[splitByDot[r]]++
    }
    c++
}

END {
    print c
    # asort(words, counts_ascending)
    # max_length(symbols, max_symbol_length_pair)
    # max_length(words, max_word_length_pair)
    # print "Symbol count: " length(symbols)
    # print "Word count: " length(words)
    # max_length_v = max_word_length_pair[1]
    # print "Longest symbol: " max_symbol_length_pair[1] "<-" max_symbol_length_pair[0]
    # print "Longest word: " max_word_length_pair[1] "<-" max_word_length_pair[0]
    # # two columns, first left justified with desired width
    # column_specifier = sprintf("%%-%us%%s\n", max_length_v + 2)
    # printf column_specifier, "Word", "Count"
    # for (i = length(counts_ascending); i > 0; i--) {
    #     count = counts_ascending[i]
    #     if (count in visited_counts)
    #         continue
    #     else
    #         visited_counts[count]
    #     for (w in words) {
    #         if (words[w] == count) {
    #             printf column_specifier, w, count
    #         }
    #     }
    # }
    for (sw in all_subwords) print sw
}

