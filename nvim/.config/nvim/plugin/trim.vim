match Error /\s\+$/

augroup plugin.trim
  autocmd!
  autocmd BufWritePre * :call trim#trailing_whitespace()
augroup end
