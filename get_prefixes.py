import sys
from antlr4 import CommonTokenStream, FileStream, InputStream, ParseTreeWalker
from PloverDictionaryParser.PloverDictionaryLexer import PloverDictionaryLexer
from PloverDictionaryParser.PloverDictionaryParser import PloverDictionaryParser
from PloverDictionaryParser.PloverDictionaryVisitor import PloverDictionaryVisitor
import antlr4.xpath.XPath as XPath

class GetPrefixesParser(PloverDictionaryParser):
    def prefix(self):
        val = super().prefix()
        print(self._ctx.getText())
        return val

for dictionary_path in sys.argv[1:]:
    input_stream = FileStream(dictionary_path, encoding='utf-8')

    lexer = PloverDictionaryLexer(input_stream)
    token_stream = CommonTokenStream(lexer)

    parser = GetPrefixesParser(token_stream)
    parser.dictionary()


# query = XPath.XPath(parser, "//prefix")
# prefixes =  query.evaluate(tree)
# for node in prefixes:
#     print(node.getText())


