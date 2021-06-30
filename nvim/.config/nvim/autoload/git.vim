function! git#branch() abort
  return getbufvar(bufnr('%'), 'git_branch')
endfunction
