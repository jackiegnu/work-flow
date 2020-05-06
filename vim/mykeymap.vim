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

" replace the current word
nnoremap <leader>sg  "vye:1,%s/<c-r>"//g<left><left>
vnoremap <leader>s  "vy:1,%s/<c-r>"//g<left><left>

" Key mapping to insert the current date
" nmap <silent> <leader>d a<c-r>=strftime("Last Modified: %Y-%m-%d:%H-%M-%S",localtime())<cr><esc>

"format source code
nnoremap <leader>fc <esc>mpgg=g<cr>

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

" Easier line-wise movement
nnoremap gh g^
nnoremap gl g$

" Drag current line/s vertically and auto-indent
nnoremap <Leader>k :m-2<CR>
nnoremap <Leader>j :m+<CR>
vnoremap <Leader>k :m'<-2<CR>gv=gv
vnoremap <Leader>j :m'>+<CR>gv=gv

" Duplicate lines
nnoremap <Leader>dl m`YP``
vnoremap <Leader>dl YPgv

" Duplicate paragraph
nnoremap <Leader>dp yap<S-}>p


" `<Tab>`/`<S-Tab>` to move between matches without leaving incremental search.
" Note dependency on `'wildcharm'` being set to `<C-z>` in order for this to
" work.
set wcm=<C-Z>
cnoremap <expr> <Tab>
  \ getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>/<C-r>/' : '<C-z>'
cnoremap <expr> <S-Tab>
  \ getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>?<C-r>/' : '<S-Tab>'

" Put vim command output into buffer
nnoremap g! :<C-u>put=execute('')<Left><Left>

" Switch (window) to the directory of the current opened buffer
map <Leader>cd :lcd %:p:h<CR>:pwd<CR>

" Smart wrap toggle (breakindent and colorcolumn toggle as-well)
nmap <Leader>tw :execute('setlocal wrap! breakindent! colorcolumn=' .
  \ (&colorcolumn == '' ? &textwidth : ''))<CR>

" Append modeline after last line in buffer
" See: http://vim.wikia.com/wiki/Modeline_magic
function! s:append_modeline() "{{{
  let l:modeline = printf(' vim: set ts=%d sw=%d tw=%d %set :',
        \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, '%s', l:modeline, '')
  call append(line('$'), l:modeline)
endfunction "}}}
nnoremap <silent> <Leader>ml :call <SID>append_modeline()<CR>

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

" Windows, buffers and tabs {{{
" -------------------------

" Ultimatus Quitos
" autocmd user_events BufWinEnter * if &buftype == ''
	" \ | nnoremap <silent><buffer> q :quit<CR>
	" \ | endif

nnoremap <C-q> <C-w>
nnoremap <C-x> <C-w>x

" Window-control prefix
nnoremap  [Window]   <Nop>
nmap      s [Window]

nnoremap <silent><C-w>z :vert resize<CR>:resize<CR>:normal! ze<CR>
nnoremap <silent> [Window]v  :<C-u>split<CR>
nnoremap <silent> [Window]g  :<C-u>vsplit<CR>
nnoremap <silent> [Window]t  :tabnew<CR>
nnoremap <silent> [Window]o  :<C-u>only<CR>
nnoremap <silent> [Window]b  :b#<CR>
nnoremap <silent> [Window]c  :close<CR>
nnoremap <silent> [Window]x  :<C-u>call <SID>window_empty_buffer()<CR>

" Split current buffer, go to previous window and previous buffer
nnoremap <silent> [Window]sv :split<CR>:wincmd p<CR>:e#<CR>
nnoremap <silent> [Window]sg :vsplit<CR>:wincmd p<CR>:e#<CR>

" Background dark/light toggle and contrasts
nmap <silent> [Window]h :<C-u>call <SID>toggle_background()<CR>
nmap <silent> [Window]- :<c-u>call <SID>toggle_contrast(-v:count1)<cr>
nmap <silent> [Window]= :<c-u>call <SID>toggle_contrast(+v:count1)<cr>

function! s:toggle_background()
	if ! exists('g:colors_name')
		echomsg 'No colorscheme set'
		return
	endif
	let l:scheme = g:colors_name

	if l:scheme =~# 'dark' || l:scheme =~# 'light'
		" Rotate between different theme backgrounds
		execute 'colorscheme' (l:scheme =~# 'dark'
					\ ? substitute(l:scheme, 'dark', 'light', '')
					\ : substitute(l:scheme, 'light', 'dark', ''))
	else
		execute 'set background='.(&background ==# 'dark' ? 'light' : 'dark')
		if ! exists('g:colors_name')
			execute 'colorscheme' l:scheme
			echomsg 'The colorscheme `'.l:scheme
				\ .'` doesn''t have background variants!'
		else
			echo 'Set colorscheme to '.&background.' mode'
		endif
	endif
endfunction

function! s:toggle_contrast(delta)
	let l:scheme = ''
	if g:colors_name =~# 'solarized8'
		let l:schemes = map(['_low', '_flat', '', '_high'],
			\ '"solarized8_".(&background).v:val')
		let l:contrast = ((a:delta + index(l:schemes, g:colors_name)) % 4 + 4) % 4
		let l:scheme = l:schemes[l:contrast]
	endif
	if l:scheme !=# ''
		execute 'colorscheme' l:scheme
	endif
endfunction

function! s:window_empty_buffer()
	let l:current = bufnr('%')
	if ! getbufvar(l:current, '&modified')
		enew
		silent! execute 'bdelete '.l:current
	endif
endfunction
" }}}

"-------------------------------------------------------------------------------------
" edit ~/.vim/myvimrc anytime while vim is open
"-------------------------------------------------------------------------------------
nnoremap <leader>vi :e ~/.vim/myvimrc.vim<cr>
" vim:ft=vim:sw=4:sts=4:expandtab:ts=4
