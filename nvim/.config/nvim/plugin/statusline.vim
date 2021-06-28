function! s:init() abort
  highlight! link StatusLine Directory
  highlight! link StatusLineNC ModeMsg
endfunction

set noshowmode

" Left
set statusline=
set statusline+=%#WildMenu#\ %{vim#mode()}\ %*
set statusline+=%#ErrorMsg#%{text#enspace(git#branch())}%*
set statusline+=\ %<%t\ %*
set statusline+=%#ModeMsg#%m\ %*

" Right
set statusline+=%=
set statusline+=\ %{strlen(&ff)?toupper(&ff):'NONE'}\ %*
set statusline+=%#ModeMsg#\|%*
set statusline+=\ %{strlen(&fenc)?toupper(&fenc):'NONE'}\ %*
set statusline+=%#ModeMsg#\|%*
set statusline+=\ %Y\ %*
set statusline+=%#WildMenu#\ %p%%\ %l:%c\ %*

augroup plugin.statusline
  autocmd!
  autocmd ColorScheme,VimEnter * call s:init()
augroup end
