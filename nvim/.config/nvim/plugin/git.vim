function! s:callback(job_id, data, event) abort dict
  const l:branch = (a:event == 'stdout') ? a:data[0] : ''
  call setbufvar(self.git_buffer, 'git_branch', l:branch)
endfunction

function! s:due(buf, min) abort
  const l:clk = getbufvar(a:buf, 'git_clock')
  const l:now = reltime()

  call setbufvar(a:buf, 'git_clock', l:now)

  if empty(l:clk)
    return 1
  endif

  const l:dif = reltime(l:clk, l:now)
  const l:sec = reltimefloat(l:dif)

  return l:sec >= a:min
endfunction

function! s:update() abort
  const l:buf = bufnr('%')

  if &modifiable && s:due(l:buf, 3.0)
    const l:cmd = [
          \ 'git',
          \ '-C',
          \ expand('%:p:h'),
          \ 'rev-parse',
          \ '--abbrev-ref',
          \ 'HEAD'
          \ ]

    const l:opt = {
          \ 'git_buffer': l:buf,
          \ 'on_stdout': function('s:callback'),
          \ 'stdout_buffered': 1,
          \ }

    call jobstart(l:cmd, l:opt)
  endif
endfunction

augroup plugin.git
  autocmd!
  autocmd BufEnter,VimEnter,WinEnter * call s:update()
augroup end
