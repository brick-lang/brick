#Brick

__Brick__ is a modern, functional, OO-like language, designed to have the expressiveness you've come to expect from languages like Ruby and Python, joined with the power of Common Lisp, Rust, and ML.


Here's a quick list of features we are working on supporting in the core language:

- Classes for organization
- Mixins
- Type Inference/Reconstruction
- Parametric Polymorphism
- Overloading
- Hygenic Macros
- Pattern Matching
- Algebraic Data Types
- Traits
- Parallelism

Here's the obligitory Hello World:
```brick
fn main
  puts("Hello, World!")
end
```

and something a bit more complex (humbly borrowed from the [Rust demo](http://www.rust-lang.org/)):
```brick
fn main
  let nums = [1, 2]
      noms = ["Chad", "Nick", "Kristen", "Steve"]
      odds = nums.map(|x| -> x * 2 - 1)
  in
    odds.each => |num|
      puts("%s says hello from a new thread!", noms[num])
    end
  end
end
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
  * [Sedlex](https://github.com/toroidal-code/sedlex/tree/pr/line): The tokenizer
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

## About Rust and Brick
It's come to my attention that some people see Brick as a clone of Rust. This is not the case.

Brick was imagined as a sister language to Rust.
Where highly performant, low-level applications may be written in Rust, Brick is intended as the flip-side of that coin: highly parallel, high-level applications.

C and C++ (and to some extant Go) are used as systems languages, Rust attepts to bring features from languages like OCaml and Haskell to this area.

On the other hand, Clojure, Scala, and OCaml are the main functional languages for application development. Clojure and Scala are tied to the JVM, while OCaml is in need of a serious overhaul of the runtime (no threading).

I want to use features from OCaml and Haskell _and Rust_ in my daily work. But I don't do systems level programming very often. It's too low level for many of the things I do.

So Brick is being designed to integrate tightly with Rust (and C). But it's not a competitor at all. If you debate between using Brick and Rust, you should re-evaluate your intent.

Not to mention that Brick is nowhere near the level development of Rust right now :P
