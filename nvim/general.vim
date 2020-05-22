"""""""""""""""""""""""""""""""""
" General Settings for Vim/NVim "
"                               "
" Coded by:                     "
" Chaotic Neutralist            "
"""""""""""""""""""""""""""""""""
" Set True Colors "
set termguicolors

" Colorscheme "
colorscheme modest

" Set line numbers
set number
set relativenumber

" Syntax enable
syntax enable

" Set map leader "
let mapleader = ','

" Update file after external change
map <leader>ee :e!<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Fast saving
nmap <leader>s :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" New line with and without leaving positon
map <leader>oo o<Esc>

" Save and quit easier
map <leader>wq :wq<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Default how splits open/close 
set splitbelow
set splitright

""""""""""""""""""""""""
" Windows/Tabs Settings"
""""""""""""""""""""""""
" Change windows easier "
no <C-j> <C-w>j| "switching to below window 
no <C-k> <C-w>k| "switching to above window
no <C-l> <C-w>l| "switching to right window 
no <C-h> <C-w>h| "switching to left window

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Resize Windows
map <leader>dv :vertical resize +5<cr>
map <leader>df :vertical resize -5<cr> 
 
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tt :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Undo file set
try
    set undodir=~/.nconf/temp_dirs/undodir
    set undofile
catch
endtry
