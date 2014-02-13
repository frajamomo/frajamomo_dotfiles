
call pathogen#infect()

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Comments handling
" Bundle 'tomtom/tcomment_vim'

" Autocomplete for Python
if has('python')
  Bundle 'davidhalter/jedi-vim'
endif

" if has('python')
"   Bundle 'nvie/vim-flake8'
" endif

autocmd BufWritePost *.py call Flake8()

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
"
"

" Enable highlighting search results
set hlsearch

" Ignore case in search patterns
set ignorecase

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

" F9: Toggle highlighting all matches of current word
map <F9> :call ToggleHighlight(1)<CR>
let g:SuperTabDefaultCompletionType = "context"
let g:jedi#popup_on_dot = 0

" Allow command completion
set wildmenu
set wildmode=list:full

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

""" COLORS AND LOOK'N'FEEL
" Set colorscheme
set t_Co=256
set background=dark
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

" Set supertab to navigate from top to bottom
let g:SuperTabDefaultCompletionType = '<c-n>'
let g:SuperTabContextDefaultCompletionType = '<c-n>'
"
" " Prevent autocompletion after several characters
let g:SuperTabNoCompleteAfter = ['^', ',', ':', "'", '"', ')', '\s']
"
" " Avoid popping up after dot
let g:jedi#popup_on_dot = 0
"
" " Avoid selecting the first item in the completion menu by default
let g:jedi#popup_select_first = 0
"
" " Avoid opening up the preview window
autocmd FileType python setlocal completeopt-=preview
