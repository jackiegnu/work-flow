" set <leader> replace the default slash with
let mapleader=','
let g:mapleader=','
"
" -------------------------------------------------------------------------------------
" CTRLP
" https://vimawesome.com/plugin/ctrlp-vim-red
" :help ctrlp-mappings
" {{{1
" -------------------------------------------------------------------------------------
let g:ctrlp_map = '<leader><c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|swp)$'
let g:ctrlp_custom_ignore = {
                  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
                  \ 'file': '\v\.(swp|so|zip)$',
                  \ 'link': 'some_bad_symbolic_links',
                  \ }

" Use fd for ctrlp.
" if executable('fd')
if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
else
    let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
endif
" }}}1
" -------------------------------------------------------------------------------------
"
" -------------------------------------------------------------------------------------
" MiniBufExpl
" {{{1
" -------------------------------------------------------------------------------------
let g:miniBufExplorerMoreThanOne =2
let g:miniBufExplModSelTarget = 3
let g:miniBufExplVSplit = 40
let g:miniBufExplSplitBelow=1
let g:miniBufExplSplitToEdge = 0
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
nnoremap <leader>u :MBEToggle<cr>
" -------------------------------------------------------------------------------------
" MiniBufExpl Colors
" -------------------------------------------------------------------------------------
" {{{2
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg
" }}}2
" }}}1
"
" -------------------------------------------------------------------------------------
" Strip White Spaces
" This plugin strip all the white spaces in your file before save it automatically
" {{{1
" -------------------------------------------------------------------------------------
" You could remove the trailing blank lines at the end of the file too;
let g:strip_trailing_lines = 1
" let g:loaded_StripWhiteSpaces = 1 " To disable it globally
" }}}1
"
" -------------------------------------------------------------------------------------
" EasyMotion
" EasyMotion provides a much simpler way to use some motions in vim.
" {{{1
nmap <leader>ss <Plug>(easymotion-s2)
" }}}1
"
" -------------------------------------------------------------------------------------
" StripWhiteSpaces
" {{{1
nnoremap <leader>sw :StripWhiteSpaces<cr>
"}}}1
" -------------------------------------------------------------------------------------
"
"-------------------------------------------------------------------------------------
" NERDTree
" The NERDTree allows you to explore your filesystem and to open files and
" directories
" {{{1
"-------------------------------------------------------------------------------------
let NERDTreeIgnore=[
        \'\.git$', '\.pyc$', '\.swp$'
        \]
nnoremap <leader>nn :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>
nnoremap <leader>nc :NERDTreeCWD<cr>
nnoremap <leader>nr :NERDTreeRefreshRoot<cr>
"}}}1
"
"-------------------------------------------------------------------------------------
" NERD COMMENTER
" Comment functions so powerful
" {{{1
"-------------------------------------------------------------------------------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
"
"}}}1
"-------------------------------------------------------------------------------------
" PythonMode
let g:pymode_doc_bind = 'K'
let g:pymode_rope_completion = 1
let g:pymode_rope_autoimport = 0
let g:pymode_rope_autoimport_import_after_complete = 0
let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime']
"
"-------------------------------------------------------------------------------------
" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical""
"
"-------------------------------------------------------------------------------------
" fzf customize
"-------------------------------------------------------------------------------------
" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }
" let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nnoremap <leader>fl :Files<cr>
nnoremap <leader>ag :Ag<cr>
nnoremap <leader>bf :Buffers<cr>

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'
"
"-------------------------------------------------------------------------------------
" Ack/ag
"-------------------------------------------------------------------------------------
let g:ackprg = "ag --vimgrep"
cnoreabbrev Ack Ack!
nnoremap <Leader>ac :Ack!<Space>
"
"-------------------------------------------------------------------------------------
" Tagbar
"-------------------------------------------------------------------------------------
nmap <leader>tb :TagbarToggle<CR>
"
"-------------------------------------------------------------------------------------
" deoplete
"-------------------------------------------------------------------------------------
" Change clang binary path
call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/clang')

" Change clang options
call deoplete#custom#var('clangx', 'default_c_options', '')
call deoplete#custom#var('clangx', 'default_cpp_options', '')

set pyxversion=3

" disable deoplete plugin due to using Coc currently
let g:deoplete#enable_at_startup = 0
let g:python3_host_prog='/home/ubuntu/anaconda3/bin/python3'

"-------------------------------------------------------------------------------------
" vim-gitgutter
"-------------------------------------------------------------------------------------
set updatetime=100 " 100ms
"
" vim: ft=vim:sw=4:sts=4:expandtab:ts=4
