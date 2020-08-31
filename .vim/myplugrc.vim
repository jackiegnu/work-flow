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
"
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

let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
" " Use fd for ctrlp.
" if executable('fd')
"     let g:ctrlp_user_command = 'fd -c never "" "%s"'
"     let g:ctrlp_use_caching = 0
" else
" 	let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
" endif
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
"-------------------------------------------------------------------------------------
" vim: ft=vim:sw=4:sts=4:expandtab:ts=4
