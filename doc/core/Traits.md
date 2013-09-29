##What is a trait, anyways?

Rust sez: "A trait describes a set of method types."  

All you Java programmers out there may go "Ha! That's an interface!"  

Well, basically, yeah. 

Traits are a way of describing common method inter-ops between classes, and (therefore) their common underlying data structures. This is very similar in practice to Java interfaces. However, there's a few things that set traits and interfaces apart.


###Traits have inheritance
A trait definition can inherit from another trait definition.
For example:
```ruby
trait Shape
    circle? -> Bool

trait Polygon < Shape
    equilateral? -> Bool
    num_sides    -> Int
```
 This means that a class `Rectangle`, which has the trait `Polygon` should implement the functions `circle?`, `equilateral?`, and `num_sides`

###Traits are types
When defining methods, traits are valid types to use for the function declaration.
```ruby
>>> square = Rectangle.new(4,4,4,4)
=> #<Rectangle:0x00000000000000>
>>> square.is_a? Rectangle
=> true # Obviously
>>> square.is_a? Polygon
=> true
>>> square.is_a? Shape
=> true
```
```ruby
method our_num_sides(polygon:Polygon) -> Int
    polygon.num_sides
```
