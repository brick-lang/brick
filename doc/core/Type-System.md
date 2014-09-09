Brick's type system is based on Daan Leijen's work in 'effectful types',
in which the type system can determine side-effects that expressions contain.

A good place to start in understanding this is to read the paper [Koka: Programming with Row-Polymophic Effect Types](http://research.microsoft.com/apps/pubs/default.aspx?id=210640).

Unlike Koka, however, Brick strives to have curry-able function application. Koka is limited to full application (unary function with a tuple argument), as the right side of the `->` binary operator is required to have effect annotations.

Brick avoids this (and allows currying) by introducing a new type operator, `+>`, which indicates full application. Thus the common `foldl` function has a type signature of `[a] -> b -> (a -> b +> e b) +> e b`. 
