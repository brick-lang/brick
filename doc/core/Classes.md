Brick is designed to be an odd amalgam of Object-Oriented concepts, coupled with fairly new ideas in the design of languages.

As mentioned in the syntax page, the `class` keyword starts a class definition block. This includes information about the object's construction, direct inheritance of data structures, and the traits the object implements.

All classes are valid types.


###The Deadly Diamond of Death
Brick solves this problem similar to Scala. Brick allows only single inheritance between classes. However, you can implement multiple traits. Traits that share method names shadow previous traits, so the last trait in the trait listing will be what is used.

## The class system
Classes in Brick are not terribly similar to Java, Obj-C, or any other language that is strict O-O. The closest implementation is Scala.  
__Methods do not get inherited between classes, but between common traits implemented in the class hierarchy__

This is very important. Without method inheritance, classes now only serve the purpose of collecting related method declarations and data structures into one place.

Instead, we rely upon the _trait_ system for a common interface and method inheritance between related classes. All altered methods inside traits implemented by a parent class are to be implemented in the child class, else we fall back to using the parent's implementation of the method in that trait.  

Traits that your parent implements but you don't explicitly state for implementation in your class are not immediately available. However, if you want to automatically use all your parent's traits, simply include the parent class' name in the `impl` list.

## Examples
Let's look at a simple class:
```brick
class Point(x:Int, y:Int)
```
From this declaration we can tell a number of things:
- The constructor takes two parameters, both Ints.
- We have two instance variables: `x` and `y` to represent a point on a 2-D plane.
- We have no parent classes
- We have no traits that we're implementing (yet)

In order to make an instance, we'd do:
```brick
glaze> x = Point(5, 2)
#=> x : Point(5, 2)
```

But this isn't terribly helpful, as we now have a Point object floating around, with nothing we can do with it. Let's change that:
```brick
class Point(x:Int, y:Int) impl ToStr
    impl ToStr
        method to_str
            "(:{i}, :{i})".fmt(self.x, self.y)
```
We're now implementing the `ToStr` trait, which is a simple trait that indicates serialization to a string.

Now we can print the object!
```brick
glaze> x = Point(5, 2)
#=> x : Point(5, 2)
glaze> x.to_str()
#=> "(5, 2)" : String
glaze> puts(x.to_str())
(5, 2)
#=> () : Unit
```

Lets add some more functionality. We'll want to be able to move the point, and perhaps to rotate it.

```brick
class Point(x:Int, y:Int) impl ToStr
    method move(dx, dy)
        Point(self.x + dx, self.y + dy)

    method rotate
        Point(self.y, self.x)

    impl ToStr
        method to_str
            "(:{i}, :{i})".fmt(self.x, self.y)
```

Now we can perform these operations
```glaze
glaze> x = Point(5, 2)
#=> () : Unit
glaze> x.move(2, 2)
#=> #<Point> : Point(7, 4)
glaze> x.rotate()
#=> #<Point> : Point(2, 5)
glaze> x
#=> #<Point> : Point(5,2)
```

Note that these operations are pure, and return new instances of the Point class, with the data we want. In order to mutate an object, we use the ref system, coupled with _mutators_, special functions that take functional ouput and ref-sets the incoming ref. Mutators have type `!ThisClass> -> ...Params -> !ThisClass`.  
Here's an example mutator:

```brick
mutator move!(dx, dy)
    self != !self.move(dx, dy)
```
For ease of use, there is a `gen_mutator` macro that can automatically generate mutators for specific methods in your class

```brick
class Point(x:Int, y:Int) impl ToStr
    method move(dx, dy)
        Point(self.x + dx, self.y + dy)

    method rotate
        Point(self.y, self.x)

    gen_mutator(move, rotate) # This creates the move! and rotate! mutators
    impl ToStr
        method to_str
            "(:{i}, :{i})".fmt(self.x, self.y)
```
Now we can use these functions!
```glaze
glaze> !x = Point(5,2)
#=> x : !Point(5,2)
glaze> x.rotate!()
#=> x : !Point(2,5)
```
