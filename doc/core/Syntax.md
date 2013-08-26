Computer languages are meant to be read.  
What a programming language is meant to do is convey an idea, as consisely and simply as possible, between two entities. Computers are now powerful enough that they do not have to be one of those entities. Instead, we should be programming as if someone looking over our shoulder could directly understand our thought process, just from looking at what we write. We should be writing for other humans, not for abstract, esoteric computer systems.  

__Brick__ is a language designed to be read. Almost every sigil translates directly to a common idea. You should be able to read your program aloud, and have it make sense.  Clear, concise, clean.

##-> (The Stabby Arrow)
The stabby arrow is probably one of the most important sigils in Brick. It is used for a variety of things, the most important of which is type declarations and signatures.

The stabby arrow is read as 'yields' or 'does'.  

####Type declarations
Since Brick is a inferred-type language, compilation and/or runtime can be dramatically sped up if we use constrained types that match the host architecture.  
```ruby
method add(num:Int) -> Int
    ret self + num
```
This method _will always_ return an `Int`. Knowing that, we can make further optimizations on functions that call this method.  
However if we were to do
```ruby
method add(num:*) # This is equivalent to add(num)
    ret self + num
```
The return type will always degrade to `Addable`, since we could end up as either a `String`, an `Int`, or some other class if we overloaded the `+` operator with the `Addable` trait. (Operator traits' functions always have a return type of that trait.)

####Blocks
The stabby arrow also indicates execution of a block. With the stabby arrow, this execution is blocking and pipelined.
```ruby
method pipelined -> None
    ['Sam', 'Dave', 'John'].each -> |name| puts name
```
The arrow is optional, but recommended.

The arrow also indicates a lazily evaluated statement:
```brick
let | x = (1..100).random
    | y -> x.sort
    y
```
In this, the x is immediately bound to a random array of `Int`s, but the y is not evaluated until we access it the first time. In addition, whenever we access y, `x.sort` will be called.  
Any variable can have both a value _and_ a block associated with it at any time. This allows for very neat constructs, such as auto-incrementing systems, and C-like iterators.

```brick
let | !x = 0
         -> !x +! 1
    | y = (1..100).to_a
    while !x <= y.size
        puts y[!x]
```
##~> (The Curvy Arrow)
The curvy arrow is used to denote parallel execution.  
It is read as 'does parallel'.  

If we were to change one of the previous examples, we can use a curvy arrow instead, to indicate that we want the lambda to be executed in parallel.
```ruby
method parallel -> None
	['Sam', 'Dave', 'John'].each ~> |name| puts name
```
The output of this function is no longer deterministic, and varies upon execution factors.

##=> (The Fat Arrow)
The fat arrow is read as 'maps to'.
So far this syntax is only used in hash maps, similar to Ruby.
```ruby
{ '1' => 2, :five => '4' }
```

##Comments
Comments are denoted by the '#' character. Single-line comments are a '#' followed by a space, with the rest of the line being devoted to the comment

Multi-line comments are done with '#=' for both the start and end blocks, and are justified to the left side of the '#'. This means that formatting and indentation performed in a block comment persists to the generated documentation. Inside of a block comment, we parse as if GitHub-flavored Markdown, which allows for succinct examples and linking.

##Classes
Classes are denoted by the `class` keyword. This indicates the start of a line which states the class's name, inheritance hierarchy, and implemented traits.

Class names are camel-cased, with the first letter being uppercase.

A class line typically follows the format:  
`class NewClass < MyClass impl Greeter`  
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
