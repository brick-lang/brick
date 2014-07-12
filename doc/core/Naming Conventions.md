#Naming Conventions

Naming conventions are _very_ important in Brick. The compiler uses them to figure out what you are trying to refer to, and how things relate.

For example:

- variables and function names are lowercase and use underscores (snake_cased):

    ```brick
    let | this_is_a_variable = 4

    fn hello_world
        puts("Hello, World!")
    ```

- predicate functions are suffixed with the question mark, like Ruby and Scheme. (`.eql?`, `=?`)

- destructive functions are suffixed with the exclamation mark. They operate on ref versions of the object. In a class, you still use self in a destructive method, but self is now a ref to the instance, as opposed to the actual instance.

    ```brick
    let | !x = 5     #=> x is a Ref<Int>
        ~> x.add!(7) #=> x is updated to 7
    ```

- mutable variables are prefixed with a exclamation mark, unlike C/ALGOL languages, where this means 'not'. (See Operators for more information). This is a compiler requirement, and the frontend will yell/fail at you if you modify an immutable variable.

    ```brick
    let | !a = 2
        a =! 4

    let | !ary = [1, 2, 3, 4]
        ary.map! -> \!x\
            x +! 1
    ```
This creates a very recognizable pattern: an exclamation point indicates impurity.

-  types are CamelCased, except for type variables, which follow the convention for variables

    ```brick
    let | x:UInt64 = 23

    class GenTuple<t>(a:t, a:t)

    datatype List<t>
        | Cons<t>(car:t, cdr:List<t>)
        | NoneType
    ```
