set visualbell
set noerrorbells

" Mappings:
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> <Up> gk
nnoremap <silent> <Down> gj
imap jj <Esc>
" Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <silent> <C-[> :nohl<CR>  
"Buffers
nmap <silent> <Leader>j :bp<CR>
nmap <silent> <Leader>k :bn<CR>
nmap <silent> <C-W><C-W> :bd<CR>
" Save
nmap <Leader>w :w<CR>
" Leader map
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"
let maplocalleader = ","

set hidden
set showcmd
set wildmenu
set hlsearch
" Because I am stupid and write :W instead of :w
command! WQ wq
command! Wq wq
command! W w
command! Q q



