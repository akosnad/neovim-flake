set pastetoggle=<F2>
 
let mapleader = ","
 
" Quitting, saving
nnoremap <leader>w <cmd>w<cr>
nnoremap <leader>W <cmd>w !sudo tee % >/dev/null<cr>
 
nnoremap <leader>q <cmd>q<cr>
nnoremap <leader>Q <cmd>q!<cr>
 
nnoremap <leader>x <cmd>x<cr>

" Buffers
nnoremap <silent><leader>, <cmd>b#<cr>

" Tabs
nnoremap <leader>t <cmd>tabnew<cr>

" Clipboard
nnoremap <leader>y "+y
nnoremap <leader>Y "*y

nnoremap <leader>p "+p
nnoremap <leader>P "*p

" Splitting
nnoremap <leader>v <cmd>vsplit<cr>
nnoremap <leader>s <cmd>split<cr>

" Window navigation
nnoremap <M-Left> <C-W>h
nnoremap <M-Right> <C-W>l
nnoremap <M-Up> <C-W>k
nnoremap <M-Down> <C-W>j

nnoremap <M-Left> <C-W>h
nnoremap <M-Right> <C-W>l
nnoremap <M-Up> <C-W>k
nnoremap <M-Down> <C-W>j

nnoremap <leader><Left> <C-W>H
nnoremap <leader><Right> <C-W>L
nnoremap <leader><Up> <C-W>K
nnoremap <leader><Down> <C-W>J

nnoremap <S-Left> <C-W>>
nnoremap <S-Right> <C-W><
nnoremap <S-Up> <C-W>-
nnoremap <S-Down> <C-W>+
