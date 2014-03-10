Memory in Brick is automatically managed. This is done with a generational garbage collector built into the runtime library.

# Object Creation
```brick
let | o = MyClass()
	o  
#=> #<MyClass:0x00000000000000> : MyClass
```

##Object Destruction
Since everything is garbage collected, you don't have to worry about this!