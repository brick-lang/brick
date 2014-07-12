#Literals

###Tuples
Tuples are basic structures that are heterogeneous (can contain multiple types).
```glaze
glaze> (1, "Hello", 4.22)
#=> (1, "Hello", 4.22) : (Fixnum * String * Float)
```
Tuple contents can be accessed using subscription.
```glaze
glaze> (1, "Hello", 4.22)[1]
#=> "Hello" : String
```

#####Note: if you want a "named" tuple (i.e. with fields), use a class.

##Sequence Containers
###Vectors
Vectors are homogeneous, variable-width, 'semi-rigid' structures.  
If you're coming from Java, Vectors are very similar to ArrayLists.  
By default vectors are allocated with space for `n + 2 * floor(n/3)` elements, where n is the number of initial elements.
```glaze
glaze> [1, 2, 3, 4]
#=> [1, 2, 3, 4] : Vector<Fixnum>
```
Vectors are backed by [VLists](http://en.wikipedia.org/wiki/VList) internally.

###Arrays
Arrays are homogenous, fixed-length, 'rigid' structures.  
They are typically allocated on the stack for performance reasons.
```glaze
glaze> [1, 2, 3, 4] : Array<~>
#=>  [1, 2, 3, 4] : Array<Fixnum>
```
They are useful for fast, short-lived calculations.  
Based on the operations performed on a container, Brick will try and make a sequence into an array.
```brick
let | a : Array<!~> = [1, 2, 3, 4]
    a.map => \e\
	    e =! !e * 2 if !e % 4 == 0

#=>  [1, 4, 3, 16] : Array<!Fixnum>
```
###Lists

##Associative Containers
###Sets
Sets are unordered, homogeneos, un-directed structures 

###Maps

Maps are homogeneous, uni-directional, associational structures.  
They are backed by an underlying optimized tree implentation.

```
{
	"One"   : 1,               # String is interned
	["Two"] : 2,               # String is an object
	[3]     : "Three",         # Int 3
	[4, 5]  : "Four and Five"
}
```


###HashMaps
HashMaps are a also data structures for relating two pieces of data, the key and the value.  
They use an underlying hash table for storage.  
HashMaps rely on the `Hashable` trait's `hash` method.

###Tables


###Performance
|                            | Vector   | List | Array |     Set     | HashSet| Map | HashMap | 
|----------------------------|:--------:|-----:|:-----:|:-----------:|:------:|:---:|:-------:|
| Access (worst)             | O(log n) | O(n) | N/A   |
| Access (average)           | O(1)     | O(n) | O(1)  | 
| Insertion (worst)          | O(1) + ? | O(n) | N/A   | 
| Insertion (average)        | O(1)     | O(1) | O(1)  |
| Search (Best)              | O(n)     | O(n) | O(n)  | O(n log(n)) | 
