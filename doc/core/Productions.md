#Productions
##Let forms
```bnf
let : 'let' assignment INDENT let_tail expr UNDENT ;

let_tail : let_tail assignment
         | assignment
         | /* empty */
         ;

assignment : bar_var aug_assgn
           ;

aug_assgn : aug_or_e '=' exp
          | aug_or_e '->' exp
          | aug_or_e '<-' exp
          ;

aug_or_e : aug_assgn
         |
         ;

bar_var : '|' var ;

var : '!' ID
    | ID
    ;

```

##Expr
```bnf
expr : expr terminus
	 | /* More things go here */
	 | NUMBER
     ;

terminus : 
```