import pathlib
import sys
import operator

from antlr4 import CommonTokenStream, FileStream, InputStream, ParseTreeWalker
from PloverDictionaryParser.PloverDictionaryLexer import PloverDictionaryLexer
from PloverDictionaryParser.PloverDictionaryParser import PloverDictionaryParser
from PloverDictionaryParser.PloverDictionaryVisitor import PloverDictionaryVisitor
import antlr4.xpath.XPath as XPath
import argparse


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--query", type=str)
    parser.add_argument("--starting-rule", type=operator.methodcaller)
    parser.add_argument("--files", nargs='+')
    parser.add_argument("--output", type=pathlib.Path, default=None, required=False)
    arguments = parser.parse_args(sys.argv[1:])
    query = arguments.query
    starting_rule = arguments.starting_rule
    files = arguments.files
    output_path = arguments.output

    for dictionary_path in files:
        input_stream = FileStream(dictionary_path, encoding='utf-8')

        lexer = PloverDictionaryLexer(input_stream)
        token_stream = CommonTokenStream(lexer)

        parser = PloverDictionaryParser(token_stream)
        xpath_query = XPath.XPath(parser, query)
        tree = starting_rule(parser)
        result = xpath_query.evaluate(tree)

        if output_path is not None:
            output = output_path.open("w", encoding="utf-8")
        else:
            output = sys.stdout

        for r in result:
            output.write(r.getText() + "\n")
        output.close()
