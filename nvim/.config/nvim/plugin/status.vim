set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" left
set statusline=                                            " clear
set statusline+=%#WildMenu#                                " begin color
set statusline+=\                                          "   space
set statusline+=%{status#mode()}                           "   vim mode
set statusline+=\                                          "   space
set statusline+=%*                                         " end color
set statusline+=%#ErrorMsg#                                " begin color
set statusline+=%{strlen(git#branch())?'\ ':''}            "   space
set statusline+=%{git#branch()}                            "   git branch
set statusline+=%{strlen(git#branch())?'\ ':''}            "   space
set statusline+=%*                                         " end color
set statusline+=\                                          " space
set statusline+=%n:                                        " buffer number
set statusline+=\                                          " space
set statusline+=%<%t                                       " file name
set statusline+=\                                          " space
set statusline+=%#ModeMsg#                                 " begin color
set statusline+=%m                                         "   modified flag
set statusline+=%*                                         " end color
set statusline+=\                                          " space

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" right
set statusline+=%=                                         " fill
set statusline+=0x%02.B\                                   " current byte
set statusline+=%#ModeMsg#                                 " begin color
set statusline+=\|\                                        "   pipe & space
set statusline+=%*                                         " end color
set statusline+=%{&ff}                                     " file format
set statusline+=\                                          " space
set statusline+=%#ModeMsg#                                 " begin color
set statusline+=%{strlen(status#encoding())?'\|\ ':''}     "   pipe & space
set statusline+=%*                                         " end color
set statusline+=%{status#encoding()}                       " encoding
set statusline+=\                                          " space
set statusline+=%#ModeMsg#                                 " begin color
set statusline+=%{strlen(&ft)?'\|\ ':''}                   "   pipe & space
set statusline+=%*                                         " end color
set statusline+=%{&ft}                                     " file type
set statusline+=%{strlen(&ft)?'\ ':''}                     " space
set statusline+=%#WildMenu#                                " begin color
set statusline+=\ %p%%\ %l:%c\                             "   position
set statusline+=%*                                         " end color

function! s:init() abort
  highlight! link StatusLine Directory
  highlight! link StatusLineNC ModeMsg
endfunction

augroup plugin.statusline
  autocmd!
  autocmd ColorScheme,VimEnter * call s:init()
augroup end
