function! s:callback(job_id, data, event) abort dict
  if a:event == 'stdout'
    const l:branch = trim(a:data[0])
    if !empty(l:branch)
      call setbufvar(self.buffer, 'branch', l:branch)
    endif
  endif
endfunction

function! s:update() abort
  if &modifiable
    const l:cmd = [
          \ 'git',
          \ '-C',
          \ expand('%:p:h'),
          \ 'rev-parse',
          \ '--abbrev-ref',
          \ 'HEAD'
          \ ]
    const l:opt = {
          \ 'buffer': bufnr('%'),
          \ 'on_stdout': function('s:callback'),
          \ }
    call jobstart(l:cmd, l:opt)
  endif
endfunction

augroup plugin.git
  autocmd!
  autocmd BufEnter,VimEnter,WinEnter * call s:update()
augroup end
