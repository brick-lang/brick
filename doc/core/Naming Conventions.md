#Naming Conventions

Naming conventions are _very_ important in Brick. The compiler uses them to figure out what you are trying to refer to, and how things relate.



For example:

- variables and function names are lowercase and use underscores (snake_cased): 
```brick
let x = this_is_a_variable

fn hello_world
    puts "Hello, World!"
```

-  types are CamelCased, except for type variables, which follow the convention for variables
```brick
let! x:UInt64 = 23

class GenTuple<t>(a:t, a:t)

datatype List<t>
    | Cons<t>(car:t, cdr:List<t>)
    | NoneType
```