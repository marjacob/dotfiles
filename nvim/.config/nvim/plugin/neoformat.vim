let g:neoformat_basic_format_trim = 1
let g:neoformat_enabled_c = ['clangformat']
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_json = ['jq']
let g:neoformat_enabled_lua = ['stylua']
let g:neoformat_enabled_python = ['black', 'isort']
"let g:neoformat_only_msg_on_error = 1

augroup plugin.neoformat
  autocmd!
  autocmd BufWritePre * silent! undojoin | Neoformat
augroup end
