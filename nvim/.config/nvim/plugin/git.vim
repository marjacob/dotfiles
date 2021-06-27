function! s:branch() abort
  return trim(s:execute('rev-parse --abbrev-ref HEAD'))
endfunction

function! s:execute(command) abort
  if &modifiable
    try
      const l:directory = expand('%:p:h')
      const l:command = 'git -C "' . l:directory . '" ' . a:command
      const l:result = system(l:command)
      if !v:shell_error
        return l:result
      endif
    catch
    endtry
  endif
  return ''
endfunction

function! s:update() abort
  call setbufvar(bufnr('%'), 'branch', s:branch())
endfunction

augroup plugin.git
  autocmd!
  autocmd BufEnter,VimEnter,WinEnter * call s:update()
augroup end
