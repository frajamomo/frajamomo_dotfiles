set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" Comments handling
Bundle 'tomtom/tcomment_vim'

" Airline
Plugin 'bling/vim-airline'

" Show differences from git repository
if version >= 703
  Bundle 'airblade/vim-gitgutter'
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required

set nocompatible
filetype off

" remap <leader> to ',' key
let mapleader = ","

" easy handling of split windows
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" strip all trailing whitespace in the current file with <leader>W
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

filetype plugin indent on  " required

" Enable syntax highlighting
syntax on

" Enable UTF-8 encoding
set encoding=utf-8

"if version >= 704
"  set relativenumber
"endif

if version >= 703
	set colorcolumn=120
endif

" Show ruler
set ruler

" Number of spaces for tabs
set tabstop=2

" Number of spaces for each step of autoindent
set shiftwidth=2


autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType sh setlocal shiftwidth=4 tabstop=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType vim setlocal shiftwidth=2 tabstop=2

" Expand tabs to spaces
set expandtab

" Do smart autoindenting
set smartindent

" Copy indentation of current line when starting a new line
 set autoindent

" Enable highlighting search results
set hlsearch
set incsearch
set showmatch

" Ignore case in search patterns
set ignorecase
set smartcase
nnoremap <leader><space> :noh<cr>

" Highlight trailing whitespaces
highlight Error ctermbg=red ctermfg=white guibg=red guifg=white
autocmd ColorScheme * highlight Error ctermbg=red ctermfg=white guibg=red guifg=white
match Error '\s\+$'
autocmd WinEnter,BufWinEnter * match Error /\s\+$/
autocmd InsertEnter * match Error /\s\+\%#\@<!$/
autocmd InsertLeave * match Error /\s\+$/
autocmd WinLeave,BufWinLeave * match Error //

" Better highlighting of matching brackets and parenthesis
highlight MatchParen cterm=none ctermbg=250 ctermfg=235 gui=none guibg=250 guifg=235

" Allow command completion
set wildmenu
set wildmode=list:full

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

""" COLORS AND LOOK'N'FEEL
" Set colorscheme
let g:molokai_original = 1
let g:rehash256 = 1
set t_Co=256
set background=dark
colorscheme molokai
" highlight Normal ctermbg=NONE
" highlight nonText ctermbg=NONE

" <CR> highlights all occurences of the current word without moving
noremap <CR> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Avoid opening up the preview window
autocmd FileType python setlocal completeopt-=preview

" shortcuts for git
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gD :diffoff!<CR><c-w>o<CR> " switch back to current file
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gs :Gstatus<CR>
" nnoremap <leader>gc :Gcommit<CR>
" nnoremap <leader>gp :Git push<CR>
" nnoremap <leader>gw :!git add . && git commit -m 'WIP' && git push<CR>

" Remove all trailing whitespaces when saving python files
autocmd FileType python autocmd BufWritePre <buffer> :%s/\s\+$//e

" Open and source vimrc easily
nnoremap <leader>c :e ~/.vimrc<CR>
nnoremap <leader>s :source ~/.vimrc<CR>

" PEP8 configuration
let g:flake8_max_line_length=120
let g:flake8_ignore='W391' " Blank line at end of file

" F2: Toggle paste mode to avoid screwing indentation
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set scrolloff=5
"set number

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
"
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

set background=dark

set statusline=%F%m%r%h%w\
set statusline+=%{fugitive#statusline()}\
set statusline+=[%{strlen(&fenc)?&fenc:&enc}]
set statusline+=\ [line\ %l\/%L]
set statusline+=%{rvm#statusline()}

set laststatus=2
