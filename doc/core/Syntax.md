Computer languages are meant to be read.  
What a programming language is meant to do is convey an idea, as consisely and simply as possible, between two entities. Computers are now powerful enough that they do not have to be one of those entities. Instead, we should be programming as if someone looking over our shoulder could directly understand our thought process, just from looking at what we write. We should be writing for other humans, not for abstract, esoteric computer systems.  

__Brick__ is a language designed to be read. Almost every sigil translates directly to a common idea. You should be able to read your program aloud, and have it make sense.  Clear, concise, clean.


#Arrows
Arrows play a large part of Brick. They indicate execution style and return types.

##-> (The Stabby Arrow)
The stabby arrow is used for a variety of things, the most important of which is return type declarations and signatures.

The stabby arrow is read as 'yields' or 'does'.  

####Type declarations
Since Brick is a inferred-type language, compilation and/or runtime can be dramatically sped up if we use constrained types that match the host architecture.  

```brick
method add(num:Int) -> Int
    return self + num
```
This method _will always_ return an `Int`. Knowing that, we can make further optimizations on functions that call this method.  
However if we were to do

```brick
method add(num:_) # This is equivalent to add(num)
    return self + num
```
The return type will always degrade to `Addable`, since we could end up as either a `String`, an `Int`, or some other class if we overloaded the `+` operator with the `Addable` trait. (Operator traits' functions always have a return type of that trait.)

####Lambdas
The stabby arrow also indicates execution of a lambda. With the stabby arrow, this execution is blocking and pipelined. Execution with this should be mostly 'pure', or having no effect on things outside of the lambda.

```brick
method pipelined -> None
    ['Sam', 'Dave', 'John'].each -> |name| puts(name)
```
The arrow is optional, but recommended as it is verbose.

##~> (The Curvy Arrow)
The curvy arrow is used to denote synchronized execution à la Clojure's `dosync`. 
It is read as 'does synchronized' or 'does atomically'.

We use a `ref` system, similar to OCaml and Clojure, though closer to Clojure. Refs can be thought of as pointers, but they're really more like what they sound like: references.

We clump impure (mutating) functionality into a 'synchronized' block. If you've ever used Clojure, you already know how this works. Synchronization ensures that side effects don't interfere with thread execution. By versioning the object's state, and then moving between versions, we eliminite race conditions.


##=> (The Fat Arrow)
The fat arrow is used to denote concurrent execution.  
It is read as 'does threaded' or 'does parallel'.  

If we were to change one of the previous examples, we can use a fat arrow instead, to indicate that we want each call of the lambda to be executed in a new thread.

```brick
method threaded -> None
    ['Sam', 'Dave', 'John'].each => |name| puts(name)
```
The output of this function is no longer deterministic, and varies upon execution factors.

__WARNING__ be careful of introducing impurity and object modification into concurrently executed lambdas. If you need to change state in a parallel lambda, prefix the line with, or create a block with, a `~>`.

##Let forms
Let forms allow you to create a new execution context. They bind values (among other things) to variables.

Unlike most imperitive languages, in Brick you cannot assign values to variables arbitrarily. Instead, a wrapping context is created, similar to Lisp, OCaml, SML, and Haskell.
<table>
<th>Lisp</th>
<th>OCaml</th>
<th>SML</th>
<th>Haskell</th>
<th>Brick</th>
<tr>
<td>
<pre lang="lisp" style="margin: 0px;">
(let ((x 5)
      (y 2))
     (+ x y))
</pre>
</td>
<td>
<pre lang="ocaml" style="margin: 0px;">
let x = 5
and y = 2 in
    x + y ;;
</pre>
</td>
<td>
<pre lang="sml" style="margin: 0px;">
let val x = 5 
    val y = 2 
in  x + y 
end
</pre>
</td>
<td>
<pre lang="haskell" style="margin: 0px;">
let x = 5
    y = 2
in  x + y
</pre>
</td>
<td>
<pre lang="brick" style="margin: 0px;">
let | x = 5
    | y = 2
    x + y
</pre>
</td>
</tr>
</table>
####Strict Assignment
As seen above, an equals sign `=` between the symbol and the value indicates an assignment. In Brick, this assignment is eager, and so `x` is immediately `5`. You can assign various things to variables, including objects, functions, classes, symbols, etc.

```brick
let | x = 5
    | add1 = |y| { y + 1 }
    add1(x)                  
#=> 6
```
Style Note: if an assigned lambda gets too large or unwieldy, consider breaking it into a closure.

####Call Assignment
Inside a `let` form, a rightward (do-type) arrow indicates function call binding. You can think of it as a kind of lazy evaluation, but it's a bit different than what you may be used to. Instead of binding the value of the return from the function call to the variable when we need it, we are actually binding the variable to the _action_ of executing a lambda or function. The associated function need to be parameterless.

Here's a couple examples:
```brick
let | x = 1.upto(10).as_vector().random()
    | y -> x.sort()
    x #=> [7, 9, 3, 1, 8, 4, 10, 2, 6, 5]
    y #=> [1,2,3,4,5,6,7,8,9,10]
    x #=> [7, 9, 3, 1, 8, 4, 10, 2, 6, 5]
    y #=> [1,2,3,4,5,6,7,8,9,10]
```
In this, the x is immediately bound to a random array of `Int`s, but the y is not evaluated until we access it. In addition, whenever we access y, `x.sort()` will be called. 

```brick
let | x -> { do_some_funcion(); Random.rand(20) }
    x #=> 19
    x #=> 3
    x #=> 5
```

Any variable can have both a value _and_ a function associated with it at any time. This allows for very neat constructs, such as auto-incrementing systems, and C-like iterators.

```brick
let | !x = 0
         ~> x.add!(1)
    | y = 1.upto(100).as_array()
    while !x <= y.size
        puts(y[!x])
```
####Promises and Futures
`let` forms also allow for creation of futures and promises. A future is a lazily-evaluated sequence that returns some object. A promise is a placeholder for some object we may have later.

```brick 
let | f <- Random.rand(10)
    | !p = Promise()        # A promise is a special ref type
    p.realize(f)
    !p                      #=> 6
```

##Comments
Comments are denoted by the '#' character. Single-line comments are a '#' followed by a space, with the rest of the line being devoted to the comment

Multi-line comments are done with '#=' for both the start and end tags, and are justified to the left side of the '#'. This means that formatting and indentation performed in a block comment persists to the generated documentation. Inside of a block comment, we parse as if GitHub-flavored Markdown, which allows for succinct examples and linking.

##Classes
Classes are denoted by the `class` keyword. This indicates the start of a line which states the class's name, and optionally, the class' parent, and implemented traits.

Class names are camel-cased, with the first letter being uppercase.

A class line typically follows the format:  
`class NewClass : MyClass impl Greeter`  
This means "declare a new class, named 'NewClass' that inherits data structures from 'MyClass', that implements the 'Greeter' trait."

##Modules
Modules are used for name-spacing. They collect related classes and methods into a single area. For example:
```ruby
module MyModule
    class MyClass
    method my_method
```
`MyClass` and `my_method` are accessed using `MyModule::MyClass` and `MyModule::my_method`

Module names are camel-cased, with the first letter being uppercase. In this way, they are indistinguishable from Classes except that `MyModule.class? -> false` and `MyModule.module? -> true`

##Traits
Traits are used for method inheritance. This allows for a flexible system that does not rely upon multiple-inheritance or interfaces, as traits combine good qualities from both systems.
