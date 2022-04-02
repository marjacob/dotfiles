function! s:on_colorscheme() abort
  highlight ExtraWhitespace ctermbg=red guibg=red
endfunction

function! s:on_syntax() abort
  syntax match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL
endfunction

augroup plugin.theme
  autocmd!
  autocmd ColorScheme * call s:on_colorscheme()
  autocmd Syntax * call s:on_syntax()
augroup end

colorscheme NeoSolarized
