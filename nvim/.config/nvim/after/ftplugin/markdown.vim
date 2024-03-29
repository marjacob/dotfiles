function! s:format()
  let l:view = winsaveview()
  execute 'normal! gggqG'
  keeppatterns %s/\s\+$//e
  call s:endline()
  call winrestview(l:view)
endfunction

function! s:reflow()
  let l:view = winsaveview()
  execute 'normal! vipJvipgq'
  keeppatterns %s/\%V\s\+\%V/ /g
  call winrestview(l:view)
endfunction

setlocal autoindent
setlocal formatoptions=antw

" Use tab as four spaces.
setlocal expandtab
setlocal shiftwidth=0
setlocal tabstop=4

" Wrap lines on words, not characters.
setlocal linebreak
setlocal nolist
setlocal wrap

" Generate Markdown headings.
" See https://github.com/junegunn/dotfiles/blob/4330c45/vimrc#L494
nnoremap <buffer> <LocalLeader>1 m`yypVr=``
nnoremap <buffer> <LocalLeader>2 m`yypVr-``
nnoremap <buffer> <LocalLeader>3 m`^i### <esc>``4l
nnoremap <buffer> <LocalLeader>4 m`^i#### <esc>``5l
nnoremap <buffer> <LocalLeader>5 m`^i##### <esc>``6l

nnoremap <buffer> <silent> <LocalLeader>f :call <SID>format()<CR>
nnoremap <buffer> <silent> <LocalLeader>p :call <SID>reflow()<CR>
