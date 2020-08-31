"-------------------------------------------------------------------------------------
" File Name: mykeymap.vim
" Author:  Jackie
" Version: 0.5 (767)
" Created: 2010-10-20 10:42:03
" Last Modified: 2020-04-28 10:54:16
" Must After Vim 7.0 {{{1
if v:version < 700
    finish
endif
"-------------------------------------------------------------------------------------
" }}}1
"
" set <leader> replace the default slash with
let mapleader=','
let g:mapleader=','

"-------------------------------------------------------------------------------------
" Window switch
"-------------------------------------------------------------------------------------
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"-------------------------------------------------------------------------------------
" formater
"-------------------------------------------------------------------------------------
com! FormatJson %!python3 -m json.tool
nnoremap <leader>fj :FormatJson <cr>

"-------------------------------------------------------------------------------------
" Buffer
"-------------------------------------------------------------------------------------
nnoremap <c-p> *:bp<cr>
nnoremap <c-n> *:bn<cr>
nnoremap <leader>bd :bd<cr>

" Close all buffers operation
nnoremap <leader>ww :wall!<cr>
nnoremap <leader>qq :wqall!<cr>

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>

" run selected vimscript
vmap <silent><leader>r "vy:@v<cr>
" run vimscript line
nmap <silent><leader>r "vyy:@v<cr>

"replace the current word
nnoremap <leader>sg  "vye:1,%s/<c-r>"//g<left><left>
vnoremap <leader>s  "vy:1,%s/<c-r>"//g<left><left>

"Key mapping to insert the current date
nmap <silent> <leader>d a<c-r>=strftime("Last Modified: %Y-%m-%d:%H-%M-%S",localtime())<cr><esc>

"format source code
nnoremap <leader>fc <esc>mpgg=g<esc>

" key Mapping Move lines
" nmap <C-Down> :<C-u>move .+1<CR>
" nmap <C-Up> :<C-u>move .-2<CR>
"
" imap <C-Down> <C-o>:<C-u>move .+1<CR>
" imap <C-Up> <C-o>:<C-u>move .-2<CR>
"
" vmap <C-Down> :move '>+1<CR>gv
" vmap <C-Up> :move '<-2<CR>gv

" set insert <paste> mode this mode can disable some features, when copy and
" paste,this mode is very useful
nnoremap <leader>pp :set paste!<cr>

" Underline current line
nnoremap __ "zyy"zp<c-v>$r-
nnoremap ++ "zyy"zp<c-v>$r=

" Copy and cut in visual mode; Paste in insert mode
vnoremap <c-c> "+y
vnoremap <c-x> "+x
imap <c-v> <esc>"+gPi

" select all
nnoremap <c-a> :<c-u>norm! ggVG<cr>

" display file name in command window
cnoremap <c-g> <c-r>=expand('%:p')<cr>

" find visually selected text
vnoremap * y/<c-r>"<cr>

"========================================
" =>really (usefull)
"   similar to surround
"========================================
nnoremap <leader>" ciw"<c-r>""<esc>
vnoremap <leader>" c"<c-r>""<esc>
nnoremap <leader>' ciw'<c-r>"'<esc>
vnoremap <leader>' c'<c-r>"'<esc>
nnoremap <leader>( ciw(<c-r>")<esc>
vnoremap <leader>( c(<c-r>")<esc>
nnoremap <leader>< ciw<<c-r>"><esc>
vnoremap <leader>< c<<c-r>"><esc>
nnoremap <leader>{ ciw{<c-r>"}<esc>
vnoremap <leader>{ c{<c-r>"}<esc>

"========================================
"=> pressing < or > will let you indent/unident selected lines
"========================================
vnoremap < <gv
vnoremap > >gv

"========================================
"=> functions
"========================================

function! LastChangeUpdate()
    let linenr = 1
  while linenr <= 30
        let line = getline(linenr)
        if line =~ 'Last Modified:'
            let line = substitute(line,'Last Modified:.*$','Last Modified: '.strftime("%Y-%m-%d %H:%M:%S"),'')
            call setline(linenr,line)
            break
         endif
         let linenr +=1
  endwhile
endfunc
nnoremap <leader>du :call LastChangeUpdate()<cr>

function! FileNameUpdate()
    let linenr = 1
    while linenr <= 30
        let line = getline(linenr)
        if line =~ 'File Name:'
            let line = substitute(line,'File Name:.*$','File Name: '.expand("%:t"),'')
            call setline(linenr,line)
            break
        endif
        let linenr +=1
    endwhile
endfunc
nnoremap <leader>dc :call FileNameUpdate()<cr>

function! AuthorUpdate()
    let linenr = 1
    while linenr <= 30
        let line = getline(linenr)
        if line =~ 'Author:'
            let line = substitute(line,'Author:.*$','Author: '.($USER),'')
            call setline(linenr,line)
            break
        endif
        let linenr +=1
    endwhile
endfunc
nnoremap <leader>da :call AuthorUpdate()<cr>

"-------------------------------------------------------------------------------------
" edit ~/.vim/myvimrc anytime while vim is open
"-------------------------------------------------------------------------------------
nnoremap <leader>vi :e ~/.vim/myvimrc.vim<cr>
" vim:ft=vim:sw=4:sts=4:expandtab:ts=4
