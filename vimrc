call pathogen#infect()

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

if version >= 704
  set relativenumber
endif

" Show ruler
set ruler

" Number of spaces for tabs
set tabstop=2

" Number of spaces for each step of autoindent
set shiftwidth=2

if version >= 703
	set colorcolumn=79
endif

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


augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" Better highlighting of matching brackets and parenthesis
highlight MatchParen cterm=none ctermbg=250 ctermfg=235 gui=none guibg=250 guifg=235

let g:toggleHighlight = 0
function! ToggleHighlight(...)
  if a:0 == 1 " Toggle behaviour
    let g:toggleHighlight = 1 - g:toggleHighlight
  endif

  if g:toggleHighlight == 0 " Normal action, highlight
    silent! exe printf('2match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
  else
    " Clear the matches
    silent! exe printf('2match IncSearch //', escape(expand('<cword>'), '/\'))
  endif
endfunction

autocmd WinEnter,CursorMoved * call ToggleHighlight()
autocmd WinLeave * 2match IncSearch //

" Start with automatic highlighting of current word disabled
call ToggleHighlight(1)

" F9: Toggle highlighting all matches of current word
map <F9> :call ToggleHighlight(1)<CR>

" Allow command completion
set wildmenu
set wildmode=list:full

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

""" COLORS AND LOOK'N'FEEL
" Set colorscheme
set t_Co=256
let g:molokai_original = 1
set background=dark
let g:rehash256 = 1
colorscheme molokai

" Avoid opening up the preview window
autocmd FileType python setlocal completeopt-=preview

" shortcuts for git
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gD :diffoff!<CR><c-w>o<CR> " switch back to current file and closes fugitive buffer
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
" nnoremap <leader>gw :!git add . && git commit -m 'WIP' && git push<CR>

" Avoid popping up after dot
let g:jedi#popup_on_dot = 0
"
" " Avoid selecting the first item in the completion menu by default
let g:jedi#popup_select_first = 0
