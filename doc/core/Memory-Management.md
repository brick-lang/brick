Memory management in Brick adopts a similar system to Obj-C and D. All of the core libraries, features, and sub-strata use manual memory management. However, it is highly recommended that you use some sort of automatic memory management system, whether it be ARC (Automatic Reference Counting), or RAII (Resource Acquisition Is Initialization)

## Manual Memory Management
Manual memory management is similar to Obj-C and C++. To create a new instance of an object on the heap, we do
```ruby
o = MyClass.new
```
or
```ruby
o = MyClass()
```
the `new` method is built-in to every class, and is an alias to the `init` and `alloc` methods, which are also built-ins. Literally:
```ruby
method self.new
    return self.alloc.init  # explicit return for clarity
```

To remove this object from the heap, we do
```ruby
o.destroy
```
The `destroy` method is synonymous to `release`
###`alloc` and `init`
The `alloc` and `init` methods allow for low-level control of an object's instantiation.

`alloc`: Allocates a dedicated memory space on the heap that corresponds to the size of the class' `struct`  
`init`: Initializes the memory space. This ensures there is no garbage data in the allocated area. This method also increments the reference counter on the object to 1.

###`release` and `dealloc`

`release`: Decrements the reference counter on an object, calls `dealloc` if the reference counter has reached 0  
`dealloc`: Deallocates the object's data structure (calls `release` on all slots). Unless you are using ARC for your object, you should call `self.superclass.dealloc` or simply `super.dealloc` at the end of your `dealloc` definition, as you need to deallocate the inherited structure slots.