function! vim#mode() abort
  let l:mode = mode()
  if l:mode ==# 'n'
    return "NORMAL"
  elseif l:mode ==? 'v'
    return "VISUAL"
  elseif l:mode ==# 'i'
    return "INSERT"
  elseif l:mode ==# 'R'
    return "REPLACE"
  elseif l:mode ==? 's'
    return "SELECT"
  elseif l:mode ==# 't'
    return "TERMINAL"
  elseif l:mode ==# 'c'
    return "COMMAND"
  elseif l:mode ==# '!'
    return "SHELL"
  endif
  return "UNKNOWN"
endfunction
