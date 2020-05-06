"-------------------------------------------------------------------------------------
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
" {{{1
"-------------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" }}}1

"-------------------------------------------------------------------------------------
" Custmized Plugin
" {{{1
"-------------------------------------------------------------------------------------
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
" Plug 'python-mode/python-mode'
Plug 'vim-airline/vim-airline'
" Plug 'vim-scripts/minibufexplorerpp'
Plug 'fholgado/minibufexpl.vim'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'vim-scripts/StripWhiteSpaces'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/mru.vim'
Plug 'scrooloose/nerdcommenter'
if v:version > 800
    Plug 'valloric/youcompleteme'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
endif
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'brooth/far.vim'
Plug 'mileszs/ack.vim'

" Dependencies: ctag
Plug 'majutsushi/tagbar'

Plug 'lfv89/vim-interestingwords'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

let g:deoplete#enable_at_startup = 1
set completeopt -=preview

" Asynchronous C/C++/Objective-C/Objective-C++ completion for Neovim.
Plug 'Shougo/deoplete-clangx'

" Asynchronous Go completion for Neovim.
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

" python
Plug 'deoplete-plugins/deoplete-jedi'

" check point
" :echo has('pythonx')
" :echo exepath('python3')
" :echo neovim_rpc#serveraddr()

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'

Plug 'gu-fan/riv.vim'
Plug 'gu-fan/InstantRst'

"}}}1

"-------------------------------------------------------------------------------------
" Plugin outside ~/.vim/plugged with post-update hook
" {{{1
"-------------------------------------------------------------------------------------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" }}}1

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

"-------------------------------------------------------------------------------------
" source current vim file
"-------------------------------------------------------------------------------------
nnoremap <leader><C-i> :source % <cr>

" vim: ft=vim:sw=4:sts=4:expandtab:ts=4
