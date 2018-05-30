# Pythonsense

## Description

`Pythonsense` is a Vim plugin that provides [text objects](http://vimdoc.sourceforge.net/htmldoc/motion.html#object-select) and [motions](http://vimdoc.sourceforge.net/htmldoc/motion.html#object-motions) for Python classes, methods, functions, and doc strings.

### Python Text Objects

-   "`ac`"    : Outer class text object. This includes the entire class, including the header (class name declaration) and decorators, the class body, as well as a blank line if this is given after the class definition.
-   "`ic`"    : Inner class text object. This is the class body *only*, thus excluding the class name declaration line and any blank lines after the class definition.
-   "`af`"    : Outer function text object. This includes the entire function, including the header (function name declaration) and decorators, the function body, as well as a blank line if this is given after the function definition.
-   "`if`"    : Inner function text object. This is the function body *only*, thus excluding the function name declaration line and any blank lines after the function definition.
-   "`ad`"    : Outer docstring text object.
-   "`id`"    : Inner docstring text object.

The differences between inner and outer class and method/function text objects are illustrated by the following:

```
class OneRing(object):             -----------------------------+
                                   --------------------+        |
    def __init__(self):                                |        |
        print("One ring to ...")                       |        |
                                                       |        |
    def rule_them_all(self):                           |        |
        self.find_them()                               |        |
                                                       |        |
    def find_them(self):           ------------+       |        |
        a = [3, 7, 9, 1]           ----+       |       |        |
        self.bring_them(a)             |- `if` |- `af` |- `ic`  | - `ac`
        self.bind_them("darkness") ----+       |       |        |
                                   ------------+       |        |
    def bring_them_all(self, a):                       |        |
        self.bind_them(a, "#000")                      |        |
                                                       |        |
    def bind_them(self, a, c):                         |        |
        print("shadows lie.")      --------------------+        |
                                   -----------------------------+
```

### Python Object Motions

- "`[[`"  : Move to start of the *current* Python class (or start of previous Python class if not currently in a class or already at the start of a class).
- "`]]`"  : Move to start of the *next* Python class.
- "`][`"  : Move to end of the *current* Python class.

- "`[m`"  : Move to start of the *current* Python function or method (or to the start of previous function or method if not currently in a function or method or already at the start of a function or method).
- "`]m`"  : Move to start of the *next* Python function or method.
- "`]M`"  : Move to end of the *current* Python function or method.

### Python Location Information

- "`g:`" : print (echo) current semantic location (e.g. ""``(class:)Foo > (def:)bar"``")

## Installation

### Manually (Example)

If you are using Vim 8.0 and above, I recommend you take advantage of the '[package](https://vi.stackexchange.com/a/9523/17621)' feature and do something like this:

    $ cd ~/.vim
    $ mkdir -p pack/import/start
    $ cd pack/import/start && git clone git://github.com/jeetsukumaran/vim-pythonsense.git

You do not have to name the mid-level directory "import"; it can be anything else that makes sense to you for this plugin (e.g., "bundle", "jeetsukumaran", "python", etc.). For more information, see the documentation on "[packages](http://vimhelp.appspot.com/repeat.txt.html#packages)".

If you are using an older Vim version and do not want to upgrade, then you would be much, much, *much* better served by using a plugin manager like [Vim-Plug](https://github.com/junegunn/vim-plug) (described below).
However, if you are stuck with an old version of Vim and *really* do not or cannot use a plugin manager, then will need to manually copy the files to the corresponding locations in your home directory:

-   "vim-pythonsense/after/ftplugin/python/pythonsense.vim" to: "~/.vim/after/ftplugin/python/pythonsense.vim"
-   "vim-pythonsense/autoload/pythonsense.vim" to: "~/.vim/autoload/pythonsense.vim"
-   "vim-pythonsense/ftplugin/python/pythonsense.vim" to: "~/.vim/ftplugin/python/pythonsense.vim"

### [pathogen.vim](https://github.com/tpope/vim-pathogen)

    $ cd ~/.vim/bundle
    $ git clone git://github.com/jeetsukumaran/vim-pythonsense.git

### [Vim-Plug](https://github.com/junegunn/vim-plug)

Add the line below into your _.vimrc_ :

    Plug 'jeetsukumaran/vim-pythonsense'

and run:

    :PlugInstall

More information on setting up [Vim-Plug](https://github.com/junegunn/vim-plug) to manage your plugins can be found [here](https://github.com/junegunn/vim-plug/wiki/tutorial).

### [Vundle](https://github.com/gmarik/vundle.git)

Add the line below into your _.vimrc_ :

    Vundle 'jeetsukumaran/vim-pythonsense'

or run:

    :VundleInstall jeetsukumaran/vim-pythonsense

## Customization

If you are unhappy with the default key-mappings you define your own which will individually override the default ones.
For example, to replicate the default mappings you would define the following in your "~/.vimrc":

```
map ac <Plug>(PythonsenseOuterClassTextObject)
map ic <Plug>(PythonsenseInnerClassTextObject)
map af <Plug>(PythonsenseOuterFunctionTextObject)
map id <Plug>(PythonsenseInnerFunctionTextObject)
map ad <Plug>(PythonsenseOuterDocStringTextObject)
map id <Plug>(PythonsenseInnerDocStringTextObject)

map [[ <Plug>(PythonsenseStartOfPythonClass)
map ]] <Plug>(PythonsenseStartOfNextPythonClass)
map ][ <Plug>(PythonsenseEndOfPythonClass)
map [m <Plug>(PythonsenseStartOfPythonFunction)
map ]m <Plug>(PythonsenseStartOfNextPythonFunction)
map ]M <Plug>(PythonsenseEndOfPythonFunction)

map g: <Plug>(PythonsensePyWhere)
```

If you want to suppress some of the key mappings entirely (i.e., without providing your own to override the functionality), you can specify one or more of the following:

```
let g:is_pythonsense_suppress_object_keymaps = 1
let g:is_pythonsense_suppress_motion_keymaps = 1
let g:is_pythonsense_suppress_location_keymaps = 1
```

to selectively suppress just the text object, motion, or information key mapping sets by respectively.

You can also suppress *all* default key mappings by specifying the following in your "~/.vimrc":

```
let g:is_pythonsense_suppress_keymaps = 1
```

Note that if you just want to customize a few of the existing mappings (while keeping all the others), you do not need to suppress any key mappings: simply provide your own key mapping to each of the "``<Plug>``" mappings you want to override, and these will be respected, while any "``<Plug>``" maps that are not so explicitly bound will be assigned to the default key maps.
So, for example, if you want to replace *just* the "``[m``", "``]m``", and "``]M``" default mappings with "``[f``", "``]f``", and "``]F``" respectively,you would specify the following in your "~/.vimrc":

```
map [f <Plug>(PythonsenseStartOfPythonFunction)
map ]f <Plug>(PythonsenseStartOfNextPythonFunction)
map ]F <Plug>(PythonsenseEndOfPythonFunction)
```

## Similar Projects

Most notable is the [vim-textobj-python](https://github.com/bps/vim-textobj-python) plugin.
Pythonsense distinguishes itself from this plugin in the following ways:

-   Stand-alone and lightweight: does not rely on [vim-textobj-user](https://github.com/kana/vim-textobj-user/wiki).
-   Also includes a docstring text object (originally from [here](https://pastebin.com/u/gfixler)).
-   Crucially (for me!) selecting an outer class, method, or function also selects the blank line following. Without this, I find I always have to (a) add a new blank line after I have, e.g. pasted the class/method/function in its new location, and (b) delete the extra blank like in the old class/method/function location. With Pythonsense, this is taken care of automatically and the cleaner approach (for me!) not only saves time and key-strokes, but the oh-so-valuable headspace taskload. For a discussion of this issue, see [here](https://github.com/bps/vim-textobj-python/issues/17), and, in particular, [here](https://github.com/bps/vim-textobj-python/issues/17#issuecomment-187735637).
-   Allows for successive invocations of text object selectors to select enclosing classes/functions.
-   Handles nested classes/functions better (though with some failing corner cases).
-   Seems to handle functions/classes with multiline arguments better.
-   Handles folds better (opens them automatically if needed).
-   Of course, also provides a docstring text object as well as the semantic location information helper ("``g:``").

## More Information on Text Objects

If you are reading all this and wondering what is a text object or why are text objects such a big deal, then the short answer is that text objects are like using a socket and rachet as opposed to a monkey wrench: as long as you can find a fit, you cannot beat the efficiency, speed, and precision (as well as elegance and pure pleasure). For more details, you could look at some of the following:

-   https://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/
-   http://owen.cymru/vim-text-objects-extend-vims-natural-language-2/
-   http://codyveal.com/posts/vim-killer-features-part-1-text-objects/

## Acknowledgements

-   The seed/inspiration (and basic logic) for the code for Python class and function text objects came from Nat Williams' "[pythontextobj.vim](https://github.com/natw/vim-pythontextobj)".
    From a practical usage standpoint, principal differences are:
    -   The semantics of outer ("a") vs inner ("i") function/class. In the original, both "a" and "i" include the class/function definition line, but "i" extends to include the space after the class/function definition. I felt that "i" should exclude the class/function declaration heading line *and* the space after the definition (i.e., just the body of the class/function), while "a" should include both the class/function declaration heading line and a space after the definition.
    -   Handles nested cases better (or at all): multiple invocations of "``ic``", "``ac``", "``if``", "``af``", etc. grab successively enclosing classes/functions. The seed/inspiration for the logic for *this*, in turn, came from Michael Smith's "[vim-indent-object](http://github.com/michaeljsmith/vim-indent-object)".
-   Code for the docstring text objects taken from the [pastebin shared by gfixler](https://pastebin.com/u/gfixler).

## Copyright and License

Copyright (C) 2018 Jeet Sukumaran.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
