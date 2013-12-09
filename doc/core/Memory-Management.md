Memory in Brick is automatically managed. This is done with a generational garbage collector built-in to the runtime library.

# Object Creation
```brick
let | o = MyClass()
	o  #=> #<MyClass:0x00000000000000>
```
The default constructor is built in to every class:
```brick
method MyClass() -> MyClass
    return self  # explicit return for clarity
```

##Object Destruction
Since everything is garbage collected, you don't have to worry about this!