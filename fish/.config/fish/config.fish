fish_add_path -g "{$HOME}/.cargo/bin"
fish_add_path -g "{$HOME}/.local/bin"

set -gx BROWSER firefox
set -gx CC clang
set -gx CXX clang++
set -gx EDITOR vim
set -gx PREFIX {$HOME}/.local
set -gx SVDIR {$HOME}/.local/var/service
set -gx VISUAL {$EDITOR}
