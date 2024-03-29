" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'shime/vim-livedown'
Plugin 'mdlerch/mc-stan.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf', { 'do': ':fzf#install()'}
Plugin 'w0rp/ale'
Plugin 'davidhalter/jedi-vim'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'tpope/vim-fugitive'
Plugin 'heavenshell/vim-pydocstring', { 'do': 'make install' }
Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plugin 'jpalardy/vim-slime'
Plugin 'Yggdroot/indentLine'
if has('nvim')
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plugin 'zchee/deoplete-jedi'
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif

Plugin 'joshdick/onedark.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


let g:python_host_prog = '/Users/batisengul/opt/anaconda3/bin/python'
let g:python3_host_prog = '/Users/batisengul/opt/anaconda3/bin/python'
let g:pydocstring_doq_path = '/Users/batisengul/opt/anaconda3/bin/doq'
let g:pydocstring_formatter = 'numpy'

let g:deoplete#enable_at_startup = 1

syntax enable
syntax on
set nocompatible              " be iMproved, required
set t_Co=256
filetype on                  " required
set bg=dark
let g:airline_theme='simple'
colorscheme onedark
"colorscheme gruvbox
"colorscheme onedark
"set background=dark
"colorscheme solarized
"let g:rehash256 = 1
set visualbell
set t_vb=
set backspace=2 " make backspace work like most other apps
set spelllang=en_gb spell
set incsearch "To do /search then :%s//replace

" Render unicode maths:
let g:tex_conceal="adgm"
set conceallevel=2

"nvim complteion manager settings
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"Airline
set laststatus=2
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
"let g:airline_section_z = '%{strftime("%a %d %b %H:%M")}'

set rnu
set nu


if $TERM_PROGRAM =~ "iTerm"
  "imap <silent> <F1> <Esc>"+p i
  " Change cursor shape between insert and normal mode in iTerm2.app
  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\" 
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
  endif
endif


let g:vimtex_quickfix_ignored_warnings = [
      \ 'Underfull',
      \ 'Overfull',
      \ 'specifier changed to',
      \ 'Package biblatex Warning',
      \ ]

set guifont=Source\ Code\ Pro:h13:cANSI

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete


"Switch buffers without saving
set hidden

set showcmd
set wildmenu
set hlsearch
" Because I am stupid and write :W instead of :w
command! WQ wq
command! Wq wq
command! W w
command! Q q

" Still it is a \t. It is just that
" Vim will interpret it to be having
" a width of 4.
set tabstop=2       " The width of a TAB is set to 4.
set shiftwidth=2    " Indents will have a width of 4
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces


" Map leader to space and tab to autocomplete
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"
let maplocalleader = ","

" Easymotion:
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Move to word
"map  <Leader>w <Plug>(easymotion-bd-w)
"nmap <Leader>w <Plug>(easymotion-overwin-w)

" Vimtex:
nmap <silent> <Leader>o :VimtexTocOpen<CR>
nmap <silent> <Leader><Leader>o :VimtexLabelsOpen<CR>
nmap <Leader>ll :VimtexCompile<CR>
nmap <silent> <Leader>lv :VimtexView<CR>

" FZF
nmap <c-p> :FZF<CR>
imap <c-p> <Esc>:FZF<CR>

" Nerdtree:
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore = ['\.pdf$', '\.aux$', '\.fls$', '\.toc$', '\.dvi$', '\.synctex', '\.log$', '\.out$', '\.blg$', '\.blg$', '\.bbl$', '\.fdb_latexmk$', '\.project\.vim$']

" Mappings:
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> <Up> gk
nnoremap <silent> <Down> gj
nnoremap <silent> <LocalLeader>w :bd<CR>
imap jj <Esc>
" Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <silent> <C-[> :nohl<CR>  
"Buffers
nmap <silent> <Leader>j :bp<CR>
nmap <silent> <Leader>k :bn<CR>
nmap <silent> <C-W><C-W> :bd<CR>
" Save
nmap <Leader>w :w<CR>

imap <D-;> %>%<CR>



" Macvim:
"set guioptions -=r
"set guioptions -=L
"


" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'


filetype plugin indent on

let macvim_skip_colorscheme=1
set t_RV=

au BufNewFile,BufRead *.py
      \ set softtabstop=4 |
      \ set shiftwidth=4 |
      \ set textwidth=79 |
      \ set expandtab |
      \ set autoindent |
      \ set fileformat=unix  |
 
au BufNewFile,BufRead *.js, *.html, *.css
      \ set tabstop=2 |
      \ set softtabstop=2 |
      \ set shiftwidth=2 |

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
nmap <silent> <Leader>; :winc w<CR>

" R
let R_in_buffer = 0
let R_applescript = 0
let R_tmux_split = 1
let R_assign_map = ";;"
let g:R_app = "rice"
let g:R_cmd = "R"
let g:R_hl_term = 0


" Set the background to be transparent
"hi Normal guibg=NONE ctermbg=NONE
set noshowmode
let g:echodoc#enable_at_startup=1

" Slime config
let g:slime_target="tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
let g:slime_dont_ask_default = 1
let g:slime_no_mappings = 1
let g:slime_cell_delimiter = "#%%"
let g:slime_python_ipython = 1
nmap <LocalLeader>cc <Plug>SlimeParagraphSend
nmap <LocalLeader>d <Plug>SlimeLineSend<CR>
nmap <LocalLeader>cd <Plug>SlimeCellSend

" Python related
let g:ale_linters = {'python': ['pylama']}
let g:airline#extensions#ale#enabled = 1
let g:ale_python_pylama_executable = '/Users/batisengul/opt/anaconda3/bin/pylama'
let g:jedi#goto_command = "<leader>d"

" Go related
autocmd FileType go nnoremap <buffer> <Leader>d :GoDef<CR>


imap <C-j> <Plug>delimitMateS-Tab
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
let g:jedi#completions_enabled = 0
" see through background
hi Normal guibg=NONE ctermbg=NONE
