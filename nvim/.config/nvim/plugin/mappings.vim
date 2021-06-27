let mapleader = ','
let maplocalleader = ';'

inoremap jj <Esc>
inoremap jk <Esc>

" Fast termination.
nnoremap <silent> <Leader>Q :q!<CR>
nnoremap <silent> <Leader>q :q<CR>

" Fast buffer navigation.
nnoremap <silent> <Leader>bD :bd!<CR>
nnoremap <silent> <Leader>bd :bd<CR>
nnoremap <silent> <Leader>be :enew!<CR>
nnoremap <silent> <Leader>bn :bn<CR>
nnoremap <silent> <Leader>bp :bp<CR>

" Fast split navigation.
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Fast file editing.
nnoremap <silent> <Leader>eg :e! ~/.gitconfig<CR>
nnoremap <silent> <Leader>ev :e! $MYVIMRC<CR>

" Support for the Dano-Norwegian alphabet.
inoremap <silent> <Leader>E É
inoremap <silent> <Leader>e é
inoremap <silent> <Leader>" Æ
inoremap <silent> <Leader>' æ
inoremap <silent> <Leader>: Ø
inoremap <silent> <Leader>; ø
inoremap <silent> <Leader>[ å
inoremap <silent> <Leader>{ Å
