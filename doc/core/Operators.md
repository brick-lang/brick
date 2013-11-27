The common operators for Brick are as follows:

##Unary operators
####`not`
Returns the logical inverse of the expression (e.g. `not true #=> false`)
Equivalent to calling `o.not`

####`bnot`
Returns the bitwise not (complement) of the expression (e.g. `bnot 1 #=> -2`)
Equivalent to calling `o.bnot`

##Binary Operators
###List Operators
####`^`
The caret represents an infix `cons` statement. This is provided for List destructuring
in pattern matching. This is analogous to the `:` operator in Haskell, and the `::` operator in
OCaml and SML. 

###Logical Operators
Note that logical operators are doubles.
####`or`, `||`
Syntax sugar for `.or`

####`and`, `&&`
Syntax sugar for `.and`

####`xor`, `^^`
Syntax sugar for `.xor`

###Arithmetic Operators
####`+`
The plus operator is syntax sugar for the `.add` method in a class. It performs either addition or concatenation, and returns a new resultant object.

####`-`
The minus operator is syntax sugar for the `.subtract` method in a class. It performs subtraction or removal (a subset from a Set), and returns a new resultant object.

####`*`
The times operator is syntax sugar for the `.multiply` method in a class. It performs multiplication on an object, whether mathematically or otherwise (string multiplication), and returns a new resultant object.

####`/`
The division operator is syntax sugar for the `.divide` method in a class. It performs division or slicing, and returns a new resultant object.

####`+!`
The plus-bang operator is syntax sugar for the `.add!` method in a class. It is identical to the `.add` method, except that it is destructive.

####`-!`
The minus-bang operator is syntax sugar for the `.minus!` method in a class. It is identical to the `.minus` method, except that it is destructive.

####`*!`
The times-bang operator is syntax sugar for the `.multiply!` method in a class. It is identical to the `.multiply` method, except that it is destructive.

####`/!`
The divide-bang operator is syntax sugar for the `.divide!` method in a class. It is identical to the `.divide` method, except that it is destructive.


###Bitwise Operators
Notice that bitwise operators are triplets. This is done to ease parsing and provide common syntax.
####`|||`
Syntax sugar for the `.bor` method.

####`&&&`
Syntax sugar for the `.band` method

####`^^^`
Syntax sugar for the `.bxor` method

####`<<<`
The shift-left operator is syntax sugar for the `.shiftl` method in a class. It performs a bitshift of one degree to the left (with no args), or a bitshift of n degrees (with argument), and returns the new resultant object.

####`>>>`
The shift-right operator is syntax sugar for the `.shiftr` method in a class. It performs a bitshift of one degree to the right (with no args), or a bitshift of n degrees (with argument), and returns the new resultant object.

####`<<<!`
Syntax sugar for the `.shiftl!` method. Identical to shift-left, except destructive.

####`>>>!`
Syntax sugar for the `.shiftr!` method. Identical to shift-right, except destructive
