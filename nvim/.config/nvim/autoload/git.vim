function! git#branch() abort
  return getbufvar(bufnr('%'), 'branch')
endfunction
