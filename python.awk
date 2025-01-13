/\(.+\)/{
    if (!/method/)
    if (!/in module/)
    if (!/attribute/)
    if (!/class in/)
    if (!/\(Windows\)/)
    if (!/C (struct|member|function|type|macro|var)/)
    if (!/\(pickle protocol\)/)
    if (match($0, /.*\((.+?)\)/, result)) {
        s = result[1, "start"]
        l = result[1, "length"]
        type = substr($0, s, l)
        types[type]++
    }
}


/class in/ {
    if (match($0, /\(class in (.*?)\)/, result)) {
        s = result[1, "start"]
        l = result[1, "length"]
        modulename = substr($0, s, l)
        useprevious = /^\(/
        if (useprevious) {
            symbols[modulename "." previous_class_name]++
        } else {
            previous_class_name = $1
            symbols[modulename "." $1]++
        }
    }
    next
}

/^.+\(.*? method\)/ {
    # methodname = gensub(/\(\)/, "", "g", $1)
    symbols[$1]++
    next
}
/\(.*? method\)/ {next}

/^.+\(.*? attribute\)/ {
    symbols[$1]++
    next
}
/\(.*? attribute\)/ {next}

/^--?.+$/ {next}

/C function/{next}
/C struct/{next}
/C member/{next}
/C type/{next}
/C macro/{next}
/C var/{next}
/RFC/{next}
/\(Windows\)/{next}
/\(pickle protocol\)/{next}

/in module/ {
    if (match($0, /.+\(in module (.*?)\)/, result)) {
        s = result[1, "start"]
        l = result[1, "length"]
        modulename = substr($0, s, l)
        previous_module_name = $1
        symbols[modulename "." $1]++
    }
    next
}

/^[[:punct:]]+$/ {
    symbols[$0]++
    next
}

/^module$/ {
    symbols[previous_symbol]++
}
/^command line option$/ {next}
/^in regular expressions$/ {
    symbols[previous_symbol]++

}

{
    sub(/,.*$/, "")
    previous_symbol = $0
}


END {
    for (t in types) print t
    # for (s in symbols) {
    #     print s
    # }
}

