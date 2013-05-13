" colorscheme desert
syntax enable
syn on
"set background=dark
if has('gui_running')
	colorscheme solarized
	set background=dark
else
	colorscheme desert
endif
set autoindent number
set guifont=Menlo:h15
set hlsearch
set wrap
set visualbell
"set linebreak
set nolist " list disables linebreak
set ignorecase
set smartcase
set tabstop=2
set shiftwidth=2
set incsearch

set directory=~/.vimswap

set textwidth=0
set wrapmargin=0
" setl fo-=ro
set autoread

set formatoptions+=1
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype on
filetype plugin on
filetype plugin indent on
filetype indent on
au FileType * setl fo-=cro

let g:ragtag_global_maps=1
let g:bufExplorerSortBy='name'       " Sort by the buffer's name.

au FileType tex setlocal wrap spell linebreak textwidth=80
au FileType tex setlocal fo=aw
au FileType py setlocal smartindent textwidth=79 tabstop=4 shiftwidth=4 expandtab 
au FileType pl setlocal linebreak textwidth=0
au FileType m setlocal linebreak nospell textwidth=0
au BufNewFile,BufRead *.ejs set filetype=html
"au FileType xhtml,xml,erb so ~/.vim/ftplugin/html_autoclosetag.vim
"au FileType r setl fo=awcrq

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let mapleader=","
" let g:Tex_ViewRule_pdf = 'open -a Preview.app'
"insert one character
noremap # i<Space><Esc>r
nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
noremap <Space> <C-F>
noremap <A-Space> <C-B>
noremap <A-n> :tabn<CR>
noremap <A-p> :tabp<CR>
nnoremap <Leader>ff :FufFile<CR>
nnoremap <Leader>fb :FufBuffer<CR>
nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap @ ?\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap <Leader>mm :w<CR> :make -j4 %<<CR>
nnoremap <Leader>pp :w<CR> :!pyxpp %<CR>
nnoremap <Leader>pc :w<CR> :!pyx %<CR>
nnoremap <Leader>bb :!bibtex %<<CR>
nnoremap <D-]> <ESC><C-W><C-W>
inoremap <D-]> <ESC><C-W><C-W>
let g:lasttab=1
nnoremap <Leader>lt :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

"nnoremap <Leader>qq <S-G>o*/<ESC>
"nnoremap <Leader>bb 1<S-G>O/*<ESC>
"nnoremap <Leader>dd V1<S-G>d
"nnoremap <Leader>bc I/*<Space><ESC>
"nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>
"nnoremap <Leader>nq dd/\/\*<CR>xp/--\~\~<CR>o/*<ESC>
imap <D-[> {<CR>}<C-O>O
imap <A-i> {<CR>}<C-O>O
imap <D-e> <CR>end<C-O>O

" nnoremap <D-O> :w<CR> :!igor %<CR> <bar> :e!<CR>
"inoremap <C-p> <Up>
"inoremap <C-n> <Down>
"imap <C-f> <Right>
"imap <C-b> <Left>
"imap <M-f> <C-Right>
"imap <M-b> <C-Left>
"imap <C-d> <Delete>
"imap <C-A> <ESC>0i
"imap <C-E> <ESC>$a
"nmap <D-e> <C-e>
"nmap <D-y> <C-y>
if v:progname =~# "Vim"
	set invmmta
endif
set cursorline
set cino=(0
set scrolloff=1
let &scrolljump = &lines / 2 - 1 

let g:pydiction_location="~/.vim/ftplugin/pydiction/complete-dict"

execute pathogen#infect()
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

