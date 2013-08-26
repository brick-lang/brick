Brick is designed to be an odd amalgam of Object-Oriented concepts, coupled with fairly new ideas in the design of languages.

As mentioned in the syntax page, the `class` keyword starts a class definition block. This includes information about direct inheritance of data structures, and the traits the object implements.

All classes are valid types.

## The class system
Classes in Brick are not terribly similar to Java, Obj-C, or any other language that is strict O-O. __Methods do not get inherited between classes, but between common traits of the class hierarchy__

This is very important. Without method inheritance, classes now only serve the purpose of collecting related method declarations and data structures into one place.

Instead, we rely upon the _trait_ system for a common interface and method inheritance between related classes. All altered methods inside traits implemented by a parent class are to be implemented in the child class, else we fall back to using the parent's implementation of the method in that trait.  

For example, if I am building a GADDAG structure, the data structure and certain methods inherit directly from a Trie class. In this case, I would define a common trait `Tree`, with methods such as `traverse`,  `find`, `add`, and `contains?`. Since a GADDAG only needs one function changed between the two classes (the `add` method), we would only write that one function in the `impl Tree` block. The rest of the methods required by the `Tree` trait would be found in the parent class, and those would be used. This is called _partial trait inheritance_ and is only valid when any parent of our class has implemented the same trait. Otherwise, __All__ methods declared by a trait must implemented, as we will not be able to traverse the hierarchy to find a class that has already implemented them. (Don't worry, the warning system will be built into the linter. We'll remind you.)
