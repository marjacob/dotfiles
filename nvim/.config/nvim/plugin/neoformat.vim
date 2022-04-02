let g:neoformat_basic_format_trim = 1
let g:neoformat_enabled_c = ['clangformat']
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_json = ['jq']
"let g:neoformat_enabled_lua = ['luaformat']
"let g:neoformat_only_msg_on_error = 1

augroup plugin.neoformat
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup end
