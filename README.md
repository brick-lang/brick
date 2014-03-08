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

##Getting Involved
So you want to help out. That's great!  
Whether you're a Ruby developer, a Node.js hipster, or a C wizard, we can use your help.

Here's some areas we're working on right now:  
* The language definition (Kind of a big deal to get this ironed out) 
* Writing the [reference compiler/interpreter](https://github.com/brick-lang/kiln). Technologies used include:
    * [OCaml](http://ocaml.org/)
    * OCamllex: The tokenizer
    * [Menhir](http://gallium.inria.fr/~fpottier/menhir/): The program parser
    * [Jane Street's Core](https://github.com/janestreet/core) library for OCaml
    * [LLVM](http://llvm.org/docs/): The backend
    * [Linenoise](https://github.com/antirez/linenoise): The REPL
* Writing the runtime for the compiler. Technologies used include:
  * [libuv](https://github.com/joyent/libuv): Cross-platform abstraction
  * [Rust](http://www.rust-lang.org/): The runtime itself
  * C: Glue between Rust, OCaml, and other pieces
* The website, [brick-lang.org](http://brick-lang.org). Possible technologies include:
  * Node.js + Express
  * Ruby + Jekyll or Sinatra
