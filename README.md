#Brick

__Brick__ is a modern, functional, object-oriented language, designed to have the expressiveness you've come to expect from languages like Ruby and Python, joined with the power of Common Lisp, Rust, and ML.


Here's a quick list of features:

- Traditional (Java/Ruby) Classes
- Mixins
- Type Inference/Reconstruction
- Parametric Polymorphism
- Multiple Dispatch
- Hygenic Macros
- Pattern Matching
- Abstract Data Types
- Traits
- Generics

Here's the obligitory Hello World:
```brick
fn main
    puts("Hello, World!")
```

and something a bit more complex (humbly borrowed from the [Rust demo](http://www.rust-lang.org/)):
```brick
fn main
    let | nums = [1, 2]
        | noms = ["Chad", "Nick", "Kristen", "Steve"]
        | odds = nums.map(|x| x * 2 - 1)
        odds.each => |num|
            puts("%s says hello from a new thread!", noms[num])
```

Interested?

Read the [docs](https://github.com/brick-lang/brick-lang/tree/master/doc/core)
