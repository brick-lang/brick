# Functions
Functions are considered one of the most important things in Brick, being a functional language. They are considered first-class citizens.

## Construction
Functions are created using the `fn` keyword. Both anonymous and named functions can be created using this.

```brick
hello = fn (name:String)
	puts("Hello, :{s}".fmt(name))
end

fn hello(name:String)
	puts("Hello, :{s}".fmt(name))
end

hello = |name:String| { puts("Hello, :{s}".fmt(name)) }
```
