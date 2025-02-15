import sys
from antlr4 import CommonTokenStream, FileStream
from antlr4.CommonTokenFactory import CommonToken
import TESTPARSER.test as Lexer
import TESTPARSER.testparser as Parser

if __name__ =="__main__":
    input_stream = FileStream("./testing.txt", encoding='utf-8')
# sys.argv[1]
    lexer = Lexer.test(input_stream)
    tokens = lexer.getAllTokens()
    
    for token in tokens:
        token: CommonToken
        print(lexer.symbolicNames[token.type], token)

        # parser = Parser.testparser(token_stream)
        # tree = (parser)
        # result = xpath_query.evaluate(tree)

        # if output_path is not None:
        #     output = output_path.open("w", encoding="utf-8")
        # else:
        #     output = sys.stdout

        # for r in result:
        #     output.write(r.getText() + "\n")
        # output.close()




