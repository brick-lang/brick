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

It is planned that block comments will be able to have a hybrid YARD/Markdown syntax that promotes good documentation practice with an emphasis on example code snippets

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
cond class
do datatype
else ensure
false fn
if impl
let loop
match members method
private public
return
self super
test true trait
unsafe until use
while
```

###Literals
Literals in Brick are complex.  Much like Ruby, we adopt an 'everything is an object' mentality. However, we also seek to work well on memory-constrained devices. This presents a bit of a problem, which can unfortunately only be solved well the way Java solved it: to a have a small set of literals, and wrapper objects for general use. 

However, we try to be smart. So if you do `let! x = 4`, we know that you don't want x to hold a reference to 4, you want x to _be_ the int 4.