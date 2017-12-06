Let's look at some numbers:

12  
0.12  
12.1  
0177  
0xEF  
12e-20  
3+4j  

### Integers
Integers are represented using the `Integer` class.
`Integer` is simply the container class for all classes that are mapped from C integer types. It is auto-optimizing, which means the class will test a number's size before allocating memory for it. If you know you are going to need to modify the number so much that it would overflow the memory space it could currently fit into (`a = 1; a <<! 63`), declare the size you want. (`ULongLong a = 1; a <<! 63`)
