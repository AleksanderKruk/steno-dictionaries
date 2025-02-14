# @namespace "string"

@load "filefuncs"

function string::title(string, words, seps, titledsep, titled, restsep) {
    split(string, words, /\<[[:lower:]]\w*?/, seps)
    for (_i=1;_i<=length(words);_i++) {
        titledsep = toupper(substr(seps[_i], 1, 1))
        restsep = substr(seps[_i], 2)
        titled = titled words[_i] titledsep restsep
    }
    return titled
}

function string::is_title(string) {
    return string !~ /\<[[:lower:]]\w*?/
}

function string::capitalise(string) {
    return toupper(substr(string, 1, 1)) substr(string, 2)
}
function string::is_capitalised(string) {
    return string ~ /^[[:upper:]]/
}

function string::character_set(string, chars, _i) {
    delete chars
    for (_i=length(string); _i>0 ;_i--)
        chars[substr(string, _i, 1)]
}

function string::character_list(string, chars, _i, _l) {
    delete chars
    _l = length(string)
    for (_i=1; _i<=_l ;_i++)
        chars[_i] = substr(string, _i, 1)
}

function string::rjust(string, width, fillchar, _fill, _i) {
    if (!fillchar) fillchar = " "
    _length = length(string)
    if (_length >= width) return string
    for (_i= width - _length; _i>0; _i--) {
        _fill = _fill fillchar
    }
    return _fill string
}

function string::remove_prefix(target, string) {
    return gensub("^" string, "", "g", target)
}


function string::ljust(string, width, fillchar, _fill, _i) {
    if (!fillchar) fillchar = " "
    _length = length(string)
    if (_length >= width) return string
    for (_i= width - _length; _i>0; _i--) {
        _fill = _fill fillchar
    }
    return string _fill
}


function string::center(string, width, fillchar, _fill, _i, _difference) {
    if (!fillchar) fillchar = " "
    if (_length >= width) return string
    _difference = int((width - _length) / 2)
    _length = length(string)
    for (_i= _difference; _i>0; _i--) {
        _fill = _fill fillchar
    }
    return _fill string fillchar _fill
}

BEGIN {
    string::character_set("abcd", chars)
    print string::rjust("abc", 10, "-")
    print string::ljust("abc", 10, "-")
    print string::center("abc", 10, "-")
    print string::remove_prefix("abcde", "abc")
    print string::remove_prefix("dabcde", "abc")
    podstawienia = gsub(/co/, "czym", "gdzie")
    for (_i = 0; _i <= n; _i++) {
        _substituted = sub(/co/, "czym", gdzie)
        if (_substituted == 0) break
    }
    print and(1, 0, 1)

}