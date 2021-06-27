function! s:refresh()
  redraw!
  redrawstatus!
endfunction

setlocal expandtab
setlocal keywordprg=:help
setlocal shiftwidth=0
setlocal tabstop=2

augroup ftplugin.after.vim
  autocmd!
  autocmd BufWritePost $MYVIMRC nested source % | call s:refresh()
augroup end
