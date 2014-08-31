# Brick: behind the scenes

Brick, at its' core, is just a modern reimagining of the syntax in front of traditional functional languages.

Human language is often structured in some subject, verb, object pattern.
For example:

	The dog barks at the tree.
	^~~~~~^ ^~~~^    ^~~~~~~^
	subject verb      object

This is most similar to Java or Smalltalk syntax.

	thing.performAction(withThing)
	[thing performAction: withThing]

However, most functional languages usually structure their sytax as verb, object, with no explicit subject contextually apparant.
OCaml and Haskell might have:

	performAction onAnotherThing thing
	ThingModule.performAction thing onAnotherThing

Unfortunately, this seems to make it harder for the language to be read.

In fact, 'Yoda' style programming is often looked down upon in certain communities because of its difficulty to understand and debug.
E.g.

	Bark at the tree, the dog does.

which is often how functional language calls are performed
```haskell
bark :: String -> String -> String
bark tree dog = "The " ++ dog ++ " barks at the " ++ tree ++ " tree."
bark "cedar" "Husky"
```

## Syntax Sugar

Brick (for now) is basically a lot of syntax sugar on top of a ML-derivative.

For example, calling

	thing.performAction(withThing)

becomes

	MyModule.Thg.performAction(thing,withThing)

in the typed syntax tree.

So how is this actually done with in the compiler? While it may look fairly straight-forward to a human (or maybe not) there's actually a lot that needs to happen.

First we need to determine the types of the expressions and unify the proper parts.

	  :?   :? -> ? -> ?    :?
	thing.performAction(withThing) : ?

We look into the current environment and determine that `thing` is of type `Thg`

	:Thg  :Thg-> ?-> ?  ?
	thing.performAction(withThing) : ?

Based on this, we can transform the call into

         :Thg -> ? -> ?         :Thg    :?
	MyModule.Thg.performAction(thing, withThing) : ?

where `MyModule.Thg` is the module/class (collection of functions) associated with the `Thg` type.

By looking up the type info of the `performAction` function, we can find that it takes a `Thg` (this is guranteed as `performAction` is a method) and also a `Wthg`, and returns `Unit`. This means we now know the type of the second parameter (if we didn't already).

         :Thg -> Wthg -> Unit   :Thg    :Wthg
	MyModule.Thg.performAction(thing, withThing) : Unit


Doing this, we can _appear_ to overload global functions without truly overloading them (such as `(+)`), without breaking or extending the type system. Multiple modules can have `(+)` defined, but only the correct one will be used based on the argument types and associativity.
