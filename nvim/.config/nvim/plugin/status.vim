set noshowmode

" Refer to :highlight for a list of available colors.
" Select colors that look good with both :set bg=dark and :set bg=light.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" left
set statusline=                                            " clear
set statusline+=%#status_mode#                             " begin color
set statusline+=\                                          "   space
set statusline+=%{status#mode()}                           "   vim mode
set statusline+=\                                          "   space
set statusline+=%*                                         " end color
set statusline+=%#status_branch#                           " begin color
set statusline+=%{strlen(git#branch())?'\ ':''}            "   space
set statusline+=%{git#branch()}                            "   git branch
set statusline+=%{strlen(git#branch())?'\ ':''}            "   space
set statusline+=%*                                         " end color
set statusline+=\                                          " space
set statusline+=%n:                                        " buffer number
set statusline+=\                                          " space
set statusline+=%<%t                                       " file name
set statusline+=\                                          " space
set statusline+=%#status_flag#                             " begin color
set statusline+=%m                                         "   modified flag
set statusline+=%*                                         " end color
set statusline+=\                                          " space

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" right
set statusline+=%=                                         " fill
set statusline+=0x%02.B\                                   " current byte
set statusline+=%#status_separator#                        " begin color
set statusline+=\|\                                        "   pipe & space
set statusline+=%*                                         " end color
set statusline+=%{&ff}                                     " file format
set statusline+=\                                          " space
set statusline+=%#status_separator#                        " begin color
set statusline+=%{strlen(status#encoding())?'\|\ ':''}     "   pipe & space
set statusline+=%*                                         " end color
set statusline+=%{status#encoding()}                       " encoding
set statusline+=\                                          " space
set statusline+=%#status_separator#                        " begin color
set statusline+=%{strlen(&ft)?'\|\ ':''}                   "   pipe & space
set statusline+=%*                                         " end color
set statusline+=%{&ft}                                     " file type
set statusline+=%{strlen(&ft)?'\ ':''}                     " space
set statusline+=%#status_position#                         " begin color
set statusline+=\ %p%%\ %l:%c\                             "   position
set statusline+=%*                                         " end color

function! s:init() abort
  highlight! link StatusLine       DiffChange
  highlight! link StatusLineNC     Folded
  highlight! link status_branch    DiffText
  highlight! link status_flag      DiffChange
  highlight! link status_mode      Search
  highlight! link status_position  Search
  highlight! link status_separator LineNr
endfunction

augroup plugin.statusline
  autocmd!
  autocmd ColorScheme,VimEnter * call s:init()
augroup end
