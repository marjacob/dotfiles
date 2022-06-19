function! s:on_syntax_enabled() abort
  syntax match TrailingWhitespace /\s\+$\| \+\ze\t/ containedin=ALL
endfunction

function! s:on_theme_changed() abort
  highlight TrailingWhitespace ctermbg=red guibg=red
endfunction

augroup plugin.theme
  autocmd!
  autocmd ColorScheme * call s:on_theme_changed()
  autocmd Syntax * call s:on_syntax_enabled()
augroup end

colorscheme solarized8
