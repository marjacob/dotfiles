function! text#enclose(text, pad) abort
  return len(a:text) > 0 ? a:pad . a:text . a:pad : a:text
endfunction

function! text#enspace(text) abort
  return text#enclose(a:text, ' ')
endfunction

