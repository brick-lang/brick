### Primitives
Brick supports most (if not all) of the C/C++/Rust scalar types (`int64`, `float`, `long long`, etc.), with auto-optimizing container types for standard operations (e.g. the `Number` type will automatically choose whether to use a `float` or a `double` based on the content).

However, primitives should only ever be used in a class' `members` block, and passing primitives around should be considered a __Bad Idea__, as they are not treated the same as other parameters.


### Parametric Polymorphism
Methods are generic by default, like they are in the ML-family of languages or Haskell.
```brick
method add(x, y)
    x + y
```

### Ad-hoc polymorphism (aka function/operator overloading)
Both functions and operators are able to be overloaded.  
For example:

```brick
class Person()
    method speak(p:Person) -> None
        puts("We engage in a meaningful conversation with the other person.")

    method speak(d:Dog) -> None
        puts("We attempt to talk to the dog, which responds by rolling over.")

    method speak(c:Cat) -> None
        puts("We attempt conversation with the cat, which simply walks away.")

    method speak(o) -> None
        puts("We talk to the thing.\n No response.")

    method speak(j:Japanese)
        puts("私たちは日本人から、日本語で話しています。")

    method speak(*args)
        args.each -> \a\
           speak(a)

class Japanese() : Person
    # Nothing to see here, move along

def main
    let | us = Person()
        | !other = Person()
        | c = Cat()
        | d = Dog()
        us.speak(c)  # determined at compile-time
        us.speak(d)  # determined at compile-time
        us.speak(!other)  # determined at run-time if other has type Japanese
        ~> other =! Japanese()  # other is still type Person, but the instance it references is now Japanese
        us.speak(!other)  # determined at run-time
```
Depending on how we call these functions, the version of `speak` we use is either decided at compile time, or a dynamic dispatch system is used.
