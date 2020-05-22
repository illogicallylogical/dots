"""""""""""""""""""""""""""""""""
" General Settings for Vim/NVim "
"                               "
" Coded by:                     "
" Chaotic Neutralist            "
"""""""""""""""""""""""""""""""""
" Set True Colors "
set termguicolors

" Colorscheme "
" set background=dark
colorscheme hyper

" Set line numbers
set number
set relativenumber

" Syntax enable
syntax enable

" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set showtabline=2
catch
endtry

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" New line with and without leaving positon
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" Save and quit easier
map <leader>wq :wq<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Default how splits open/close 
set splitbelow
set splitright

" Undo file set
try
    set undodir=~/.nconf/temp_dirs/undodir
    set undofile
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ---- Mappings

" Set map leader "
let mapleader = ','

" Update file after external change
map <leader>ee :e!<cr>

" Fast saving
nmap <leader>s :w!<cr>

""""""""""""""""""""""""
" Windows/Tabs Settings"
""""""""""""""""""""""""
" Change windows easier "
" no <C-j> <C-w>j| "switching to below window
" no <C-k> <C-w>k| "switching to above window
" no <C-l> <C-w>l| "switching to right window
" no <C-h> <C-w>h| "switching to left window

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Resize Windows
map <leader>vp :vertical resize +10<cr>
map <leader>vm :vertical resize -10<cr> 
 
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tt :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" ---- Sources

" ---- Plugin settings

"""""""""""""""""""""""""""""""""
" Plugin Settings for Vim/NVim "
"                               "
" Coded by:                     "
" Chaotic Neutralist            "
"""""""""""""""""""""""""""""""""

"""""""""""""""
" Vim Airline "
"""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

"""""""
" MRU "
"""""""
" map <leader>mr :CocList mru<cr>

""""""""""""""""""
" Nerd Commenter "
""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 0
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"""""""""""""""""""""""
"Line Number Interval "
"""""""""""""""""""""""
" let g:line_number_interval#enable_at_startup = 1
" let g:line_number_interval = 5
" let g:line_number_interval#use_custom = 1
" highlight HighlightedLineNr guifg=LightGreen ctermbg=White
" highlight DimLineNr guifg=DarkCyan ctermfg=Magenta
" highlight LineNr guifg=Yellow
" highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
"""""""""""
" Neomake "
"""""""""""
" let b:neomake_open_list = 2
" map <leader>nm :lopen<cr>
" map <leader>ln :lnext<cr>
" map <leader>lp :lprev<cr>
" let g:neomake_list_height = 3


"""""""""""""
" NeoFormat "
"""""""""""""
" let g:neoformat_enabled_python = ['yapf', 'autopep8', 'docformatter']
" " Enable alignment
" let g:neoformat_basic_format_align = 1

" " Enable tab to spaces conversion
" let g:neoformat_basic_format_retab = 1

" " Enable trimmming of trailing whitespace
" let g:neoformat_basic_format_trim = 1

" Easy Motions
" map <Leader>k <Plug>(easymotion-prefix)
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"""""""""""""
" IncSearch "
"""""""""""""
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" incsearch.vim x fuzzy x vim-easymotion
function! s:config_fuzzyall(...) abort
  return extend(copy({
  \   'converters': [
  \     incsearch#config#fuzzy#converter(),
  \     incsearch#config#fuzzyspell#converter()
  \   ],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall())
noremap <silent><expr> z? incsearch#go(<SID>config_fuzzyall({'command': '?'}))
noremap <silent><expr> zg? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))

""""""""""
" TabBar "
""""""""""
" nmap <F8> :TagbarToggle<CR>

"""""""
" COC "
"""""""
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json,python,vim setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
noremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" Coc MRU
noremap <silent> <space>m :<C-u>CocList mru<CR>


" Coc Explorer
map <leader>nn :CocCommand explorer --toggle<cr>

" Use <C-l> for trigger snippet expand.
 imap <C-l> <Plug>(coc-snippets-expand)

" " Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Coc Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

vmap <leader>fc  <Plug>(coc-format-selected)
nmap <leader>fc  <Plug>(coc-format-selected)

" Coc Highlight
autocmd CursorHold * silent call CocActionAsync('highlight')


" Coc Extentions
let g:coc_global_extensions = [
			\ 'coc-snippets',
			\ 'coc-todolist',
			\ 'coc-zi',
			\ 'coc-bookmark',
			\ 'coc-template',
			\ 'coc-pairs',
			\ 'coc-spell-checker',
			\ 'coc-highlight',
			\ 'coc-lists',
			\ 'coc-explorer',
			\ 'coc-prettier',
			\ 'coc-json',
			\ 'coc-python',
			\ 'coc-css',
			\ 'coc-xml',
			\ 'coc-phpls',
			\ 'coc-html'
			\ ]


			" \ 'coc-tsserver',
			" \ 'coc-eslint',
 
""""""""""""
" Vim Plug "
""""""""""""

" Vim Plug "
call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'IMOKURI/line-number-interval.nvim'
Plug 'Rigellute/shades-of-purple.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'yegappan/mru'
" Plug 'neomake/neomake'
" Plug 'junegunn/fzf'
" Plug 'pbogut/fzf-mru.vim'
" Plug 'cliuj/vim-dark-meadow'
" Plug 'sbdchd/neoformat'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'hynek/vim-python-pep8-indent'
" Plug 'mitsuhiko/vim-python-combined'
" Plug 'mitsuhiko/vim-jinja'
" Plug 'jmcantrell/vim-virtualenv'
" Plug 'majutsushi/tagbar'
" Plug 'Yggdroot/indentLine'
" Plug 'majutsushi/tagbar'
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
"Plug 'davidhalter/jedi-vim'
"Plug 'shapeoflambda/dark-purple.vim'
"Plug 'artanikin/vim-synthwave84'
" Plug 'scrooloose/nerdtree'
" Plug 'rstacruz/vim-closer'

call plug#end()

" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
" call neomake#configure#automake('nrwi', 500)
