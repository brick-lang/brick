#Literals
###Tuples
Tuples can contain multiple types
```glaze
glaze> (1, "Hello", 4.22)
#=> (1, 2, 3, 4) : (Fixnum * String * Float)
```

###Vectors
Vectors can contain elements of a single type.
```glaze
glaze> [1, 2, 3, 4]
#=> [1, 2, 3, 4] : [Fixnum]
```

###HashMaps
Hash Maps can contain multiple types for keys (provided the keys are hashable), mapped to multiple types for values.
Like Python, interned strings are the default keys. They are interned automatically.

```
{
	"One"   : 1,               # String is interned
	["Two"] : 2,               # String is an object
	[3]     : "Three",         # Int 3
	[4, 5]  : "Four and Five"
}
```
