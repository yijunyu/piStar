TARGETS += README.js

all: $(TARGETS)

%.js: index.js %
	merge.sh $* 

package.json: 
	npm init
	npm install antlr4

%.js: istar2.js %.istar2
	node istar2.js $*.istar2
	cp $*.js ../goalModel.js

%.istar2: json.js %.json
	node json.js $*.json

JUNK += ../goalModel.js

index.js: iStar2Parser.js iStar2Lexer.js iStar2ParserVisitor.js

OS=$(shell uname -s)
ifeq ($(OS),Darwin)
	antlr=antlr
else
	antlr=antlr4
endif

iStar2Parser.js iStar2Lexer.js iStar2ParserVisitor.js: iStar2Parser.g4 iStar2Lexer.g4
	$(antlr) -Dlanguage=JavaScript -no-listener iStar2Lexer.g4
	$(antlr) -Dlanguage=JavaScript -no-listener -visitor iStar2Parser.g4
JUNK += iStar2Parser.js iStar2Parser.interp iStar2Parser.tokens iStar2ParserVisitor.js
JUNK += iStar2Lexer.js iStar2Lexer.interp iStar2Lexer.tokens

clean::
	rm -f $(TARGETS) $(JUNK)
