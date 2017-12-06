```
[1,2,3,4,5] : [Int]
[1.2, 3.4, 5.6] : [Float]
[1.2, 3, 4, 5] : [Numeric] Should warn "Unified Type is not a leaf in the type tree, in order to unbox the values, you will need to use a match expression."
[(1, 2.0), (3, 4.5)] : [(Int, Float)]
```

```
  Number
  /   \
Int Float
```
```
type Number
	| Float of float
	| Int of int
```

```
Number
	complex
	^
	real <- flonum (inexact)
	^
	rational (exact)
	^
	integer
	^     ^
fixnum  bignum
```


# Automatic anonymous variant creation

```
fn foo(false)
  false
end

fn foo(true) -> String
  "true"
end

foo :: Bool -> %[ Bool | String ]


fn bar(b)
  match foo(b)
    | String(s) -> print(s)
    | Bool(b) -> print(b.as_str())
  end
end

bar :: Bool -> ()
```
