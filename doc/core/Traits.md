## What is a trait, anyways?

Rust says: "A trait describes a set of method types."  

All you Java programmers out there may go "Ha! That's an interface!"  

Well, basically, yeah.

Traits are a way of describing common method inter-ops between classes, and (therefore) their common underlying data structures. This is very similar in practice to Java interfaces. Prior to Java 1.8, interfaces only described the methods that the interface used. However, now interfaces can have default implementations. Since Java also generic interfaces, Java's 'interface' has actually become more of a 'trait'.

## Traits have inheritance
A trait definition can inherit from another trait definition.
For example:
```brick
trait Shape
  circle? -> Bool
end

trait Polygon : Shape
  equilateral? -> Bool
  num_sides    -> Int
end
```
This means that a class `Rectangle`, which has the trait `Polygon` should implement the functions `circle?`, `equilateral?`, and `num_sides`. All of these method declarations are 'abstract'; they don't have any concrete implementation of the method. The compiler will warn you when using a trait and not implementing all abstract methods.

## Traits are types
When defining methods, traits are valid types to use for the function declaration.

```ibr
br> square = Rectangle.new(4,4,4,4)
=> #<Rectangle:0x00000000000000>
br> square.is_a?(Rectangle)
=> true
br> square.is_a?(Polygon)
=> true
br> square.is_a?(Shape)
=> true
```

```brick
fn our_num_sides(polygon:Polygon) -> Int
  polygon.num_sides()
end
```

## Traits can be generic
Traits can be generalized for a class. A good example of this is t
