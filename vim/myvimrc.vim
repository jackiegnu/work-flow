" set <leader> replace the default slash with
let mapleader=','
let g:mapleader=','

"-------------------------------------------------------------------------------------
"" general  {{{1
"-------------------------------------------------------------------------------------
set nocompatible " use vim as vim, should be put at the very start
filetype plugin on " enable loading the plugin for appropriate file type
set wildmenu " type :h and press <Tab> to look what happens
" }}}1
"

"-------------------------------------------------------------------------------------
" text formatting/layout {{{1
"-------------------------------------------------------------------------------------
set ai " autoindent
set si " smartindent
set cindent " do C-style indenting
set fo=tcrqn " see help (complex)
set tabstop=4 " tab spacing (settings below are just to unify it)
set softtabstop=4 " unify
set shiftwidth=4 " unify
set expandtab " expand tabs
set smarttab " use tabs at the start of a line, spaces elsewhere
set nowrap " do not wrap lines
set scrolloff=3 " Minimal number of screen lines to keep above and below the cursor.
set cursorline
set showcmd " show the command being typed
set showmatch " Show matching brackets
set sidescrolloff=5 " Keep 5 lines at the size
set matchtime=5 " How many tenths of a second to blink matching brackets for
set nostartofline " Leave my cursor where it was
set shortmess=aOstT " Shortens messages to avoid 'press a key' prompt
set autochdir " Always switch to the current file directory
set autoread " Set to auto read when a file is changed from the outside
set colorcolumn=85 " Show color column
" }}}1
"-------------------------------------------------------------------------------------
"  K keywordprg
" -------------------------------------------------------------------------------------
au  BufRead,BufNewFile *.vim set keywordprg=:help
au  BufRead,BufNewFile *.sh  set keywordprg=man\ -s
au  BufRead,BufNewFile *.c   set keywordprg=man\ 3\ -s
"
"-------------------------------------------------------------------------------------
" Turn backup off,
"-------------------------------------------------------------------------------------
set nobackup
set nowb
set noswapfile

"Persistent undo
set undodir=~/.vim/undodir
set undofile

"program setting
au  BufRead,BufNewFile *.c  set foldmarker={,}
"
"-------------------------------------------------------------------------------------
" MRU
" {{{1
"-------------------------------------------------------------------------------------
" let g:MRU_Exclude_Files = '\c\v(\\|\/)%(Temp|Tmp)\1'
" let g:MRU_Max_Entries = 80
let g:MRU_Check_File = 1
let g:MRU_File = expand('~/.vim/.vim_mru_files')
"
nnoremap <leader>mr :MRU<cr>
"}}}1
"
"-------------------------------------------------------------------------------------
"Omni completion
"{{{1
"-------------------------------------------------------------------------------------
set omnifunc=syntaxcomplete#Complete
set completeopt=menu,longest
hi PmenuSel term=reverse ctermbg=4 gui=undercurl guisp=Blue
"}}1
"
"-------------------------------------------------------------------------------------
" close and open file, to recovery original cursor position
" Easy goto original line number
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

set foldmethod=marker

source ~/.vim/mykeymap.vim
source ~/.vim/myplug.vim
source ~/.vim/myplugrc.vim

"-------------------------------------------------------------------------------------
" vim: ft=vim:sw=4:sts=4:expandtab:ts=4
