# replace-pairs

[![travis](https://travis-ci.org/davidshepherd7/replace-pairs.svg?branch=master)](https://travis-ci.org/davidshepherd7/replace-pairs) [![GPLv3](http://img.shields.io/badge/license-GNU%20GPLv3-blue.svg)](https://github.com/davidshepherd7/replace-pairs/blob/master/LICENSE)

Query replace pairs of things with a single command. For example convert

    Foo(bar[X])
   
to

    Foo(bar<X>)
    
with `M-x replace-pairs <RET> [ <RET> < <RET> !`, just like `query-replace` but recognising closing brackets as well.


## Features

* The interface and keymap is identical to `query-replace`.

* Add new pairs with `replace-pairs-add-pair`, e.g. to add support for `{}`
  you would call:

      (replace-pairs-add-pair "{" "}")

  from your config. Of course this is just an example, `{}` is already
  supported!
  
* Inputs `(`, `)` and `()` are recognised as the pair `()`.
