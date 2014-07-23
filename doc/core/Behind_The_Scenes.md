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

However, most functional languages usually structure their sytax as verb, object. With no explicit subject contextually apparant.
OCaml and Haskell might have:

	performAction onAnotherThing thing
	ThingModule.performAction thing onAnotherThing

Unfortunately, this seems to make it harder for the language to be read.

In fact, 'Yoda' style programming is often looked down upon because of its difficulty to understand and debug.
This is things like

	Bark at the tree, the dog does.

which is often how functioal language calls are performed
```haskell
bark :: String -> String -> String
bark tree dog = "The " ++ dog ++ " barks at the " ++ tree ++ " tree."
bark "cedar" "Husky"
```

Brick is a lot of syntax sugar on top of a ML-derivative.

For example, calling

	thing.performAction(withThing)

becomes

	ThingModule.performAction(thing,withThing)

in the typed syntax tree.

So how is this actually done with in the compiler. While it may look fairly straight-forward to a human (or maybe not) there's actually a lot that needs to happen.

First we need to determine the types of the expressions and unify the proper parts.

	  :?   :? -> ? -> ?    :?
	thing.performAction(withThing)

We look into the current environment and determine that `thing` is of type `Thg`

	:Thg  :Thg-> ?-> ?  ?
	thing.performAction(withThing)

Based on this, we can transform the call into

         :Thg -> ? -> ?         :Thg    :?
	My.Module.Thg.performAction(thing, withThing)

By looking up the type info of the `performAction` function, we can find that it takes a `Thg` (this is guranteed as `performAction` is a method) and also a `Wthg`, and returns `Unit`. This means we now know the type of the second parameter (if we didn't already).

         :Thg -> Wthg -> Unit   :Thg    :Wthg
	My.Module.Thg.performAction(thing, withThing)	


By doing this, we can _appear_ to overload functions without truly overloading them such as `(+)`.
