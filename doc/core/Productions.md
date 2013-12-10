#Productions
##Let forms
```bnf
let : 'let' assignment INDENT let_tail expr UNDENT ;

let_tail : let_tail assignment
         | /* empty */
         ;
assignment : '|' var '=' expr pnt_or_e
           | '|' var '<-' expr pnt_or_e
           | '|' var pnt_exec
           ;

pnt_exec : '~>' expr
         | '->' expr
         | '=>' expr
         ;

pnt_or_e : pnt_exec | ;

var : '!' ID type_annot
    | ID type_annot
    ;

type_annot : ':' TYPE | ;

```

##Expr
```bnf
expr : /* More things go here */
     | NUMBER
     | IDENT
     | lambda
     ;

term_expr : expr [terminus expr]* {terminus} ;

terminus : '\n' | ';' ;

block : INDENT term_expr UNDENT
      | '{' term_expr '}'
      ;
```

##Lambda
```bnf
lambda : var_bind block
       | var_bind expr
       ;

var_bind : '|' args '|'
         |
         ;

args : args ',' var
     | var
     | /* None */
     ;
```