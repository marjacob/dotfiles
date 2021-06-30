const s:mode = {
      \ "R": 'REPLACE',
      \ "S": 'S-LINE',
      \ "V": 'V-LINE',
      \ "\<C-s>": 'S-BLOCK',
      \ "\<C-v>": 'V-BLOCK',
      \ "c": 'COMMAND',
      \ "i": 'INSERT',
      \ "n": 'NORMAL',
      \ "s": 'SELECT',
      \ "t": 'TERMINAL',
      \ "v": 'VISUAL',
      \ }

function! status#encoding() abort
  return &fileencoding ? &fileencoding : &encoding
endfunction

function! status#mode() abort
  return get(s:mode, mode(), '')
endfunction
