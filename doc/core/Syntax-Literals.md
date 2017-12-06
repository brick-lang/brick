# Syntax Literals

## String literals
Strings are represented with quotes: `'string'` or `"interpolated string"`. Use single quotes `'` when you don't need the extra features. 

## Multi-line Strings
Multi-line strings are represented with triple-quotes `'''Some String'''` or `"""Some String"""`


## Map literals
Map literals are similar to JSON, with some extensions.
```brick
glaze> let english_to_japanese = {
	'hello' : 'こにちわ',
	'yes'   : 'はい',
	'one'   : '一',
	'two'   : '二',
	'three' : '三',
	'red'   : '赤い',
	'black' : '黒い',
	'white' : '白い',
	['blue-green', 'blue'] : '青い',
	'green' : '緑'
}

english_to_japanese : Map<String, String>
```

## Sequence literals
Sequence literals are represents by square brackets: `[ ]`. The default type of the sequence literal is `Vector`. With type annotations, this literal can also be used with any other type that implements the `Sequence` trait, such as `List`, `Array`, and `Vector`.
```brick
glaze> let my_vec = [1,2,3,4,5]

my_vec : Vector<Numeric> = [1,2,3,4,5]

glaze> let my_list : List<~> = [1,2,3,4,5]

my_list : List<Numeric> = [1,2,3,4,5]
```
