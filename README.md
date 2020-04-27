# work-flow
work flow

# vimscript
https://learnvimscriptthehardway.stevelosh.com/

# vim plugin
- https://github.com/mhinz/vim-startify
- https://github.com/preservim/nerdtree
- https://github.com/python-mode/python-mode
- https://github.com/Yggdroot/indentLine
- https://github.com/kien/ctrlp.vim
 ```
  * let g:ctrlp_map = '<c-p>'
 ```
- https://github.com/tpope/vim-surround

# colortheme
- https://github.com/w0ng/vim-hybrid
- https://github.com/altercation/vim-colors-solarized
- https://github.com/morhetz/gruvbox


# vim awesome
- https://vimawesome.com/
- https://vimawesome.com/plugin/vim-airline-superman


# misc
```
 func SetTitle()
         if &filetype == 'python'
                 call setline(1, "\#! /usr/bin/env python")
                 call setline(2, "\# -*- coding:utf-8 -*-")
                 normal G
                 normal o
                 normal o
                 call setline(5, "if __name__ == '__main__':")
                 call setline(6, "    pass")
         endif
         u
 endfunc
```
