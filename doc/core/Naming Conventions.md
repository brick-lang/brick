#Naming Conventions

Naming conventions are _very_ important in Brick. The compiler uses them to figure out what you are trying to refer to, and how things relate.



For example:

- variables and function names are lowercase and use underscores (snake_cased): 

```brick
let! x = this_is_a_variable

fn hello_world
    puts "Hello, World!"
```

- predicate functions are suffixed with the question mark, like Ruby and Scheme. (`.eql?`, `=?`)

- destructive functions are suffixed with the exclamation mark. For example `let` creates a new execution context, while `let!` adds to the current execution context.

- mutable variables are prefixed with a exclamation mark, unlike C/ALGOL languages, where this means 'not'. (See Operators for more information). This is a compiler requirement, and the frontend will yell/fail at you if you modify an immutable variable. Mutable variables are passed _by reference_  so that we can modify them, while all other objects are passed by value, unless explicitly stated.

```brick
let! !a = 2
a =! 4

let! !ary = [1, 2, 3, 4]

!ary.map! |!x|
    !x +! 1
```
This creates a very recognizable pattern, with `!var.edit!`. I'll be the first to admit it takes some getting used to, but it allows for very easily finding unintentional side-effects in code.

-  types are CamelCased, except for type variables, which follow the convention for variables

```brick
let! x:UInt64 = 23

class GenTuple<t>(a:t, a:t)

datatype List<t>
    | Cons<t>(car:t, cdr:List<t>)
    | NoneType
```