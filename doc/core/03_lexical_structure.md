#Lexical Structure
##Comments
```bnf
comment : block_comment
        | line_comment ;
block_comment : '#=' block_comment_body * '#' + '=' ;
block_comment_body : non_hash *
                   | '*' + non_hash_or_equal ;
line_comment = '#' non_eol * ;

```
Comments in Brick follow a similar from to that of Ruby line and block-comment forms.

It is planned that block comments will be able to have a hybrid YARD/Markdown syntax that promotes good documentation practice with an emphasis on examples.

Non-doc comments are interpreted as a form of whitespace.

##Whitespace
```bnf
whitespace_char : '\x20'
	            | '\x09' ;
whitespace : [ whitespace_char | comment ] + ;
```
The whitespace_char production is any nonempty Unicode string consisting of either a U+0020 (space, ' ') or U+0009 (tab, '\t').

In Brick, whitespace is significant, similar to Ruby and Python. It's actually closer to Python, in that we count the whitespace, and then take the difference between two lines in order to insert an `INDENT` or `UNDENT` token.

##Newlines
```bnf
newline_char : '\x0a'
	         | '\x0d' ;
```
U+000A (LF, '\n') or U+000D (CR, '\r')

##Tokens
###Keywords
```
break
cond
do datatype
else extern
false fn
if impl
let loop
match members
private public
return
self super
true trait type
unsafe use
while
```
