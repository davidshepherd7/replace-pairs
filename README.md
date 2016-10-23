# replace-pairs

[![travis](https://travis-ci.org/davidshepherd7/replace-pairs.svg?branch=master)](https://travis-ci.org/davidshepherd7/replace-pairs)

Find-replace pairs of things with a single command. For example convert

    Foo[X]
    Bar[X]
   
to

    Foo(X)
    Bar(X)
    
with `M-x query-replace-pairs <RET> [ <RET> ( <RET> !`, like a smarter `query-replace`.


## Features

* Provides `query-replace-pairs` and `replace-pairs` which work as you might expect.

* Shared interface and keymap with `query-replace/replace-string` respectively.

* Add new pairs with `replace-pairs-add-pair`, e.g. to add support for `{}`
  you would call:

      (replace-pairs-add-pair "{" "}")

  from your config. Of course this is just an example, `{}` is already
  supported!
  
* Inputs `(`, `)` and `()` are recognised as the pair `()`.
