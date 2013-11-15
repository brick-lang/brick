Memory in Brick is automatically managed. This can be done with either Garbage Collection or Automatic Reference Counting, depending on the implementation.

# Object Creation
```ruby
let! o = MyClass()
```
The default constructor is built in to every class:
```ruby
method MyClass()
    return self  # explicit return for clarity
```
This method also increments the reference count of the object to 1.

###Object Destruction

The reference counter is incremented when an object enters a new scope, and decremented when the object goes out of scope. A deallocation is performed if the reference counter has reached 0