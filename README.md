# replace-pairs

Query-replace pairs of things.

Typical useage is `M-x replace-pairs <RET> ( <RET> [`
to replace `(` with `[` and `)` with `]`.


Add new pairs with `replace-pairs-add-pair`, e.g. to add support for `{}`
you would call:

    (replace-pairs-add-pair "{" "}")

from your config. Of course this is just an example, `{}` is already
supported!
