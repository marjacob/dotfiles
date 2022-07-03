if status is-interactive
    set -gx BROWSER firefox
    set -gx CC clang
    set -gx CXX clang++
    set -gx EDITOR vim
    set -gx GOPATH {$HOME}/.go
    set -gx PREFIX {$HOME}/.local
    set -gx SVDIR {$HOME}/.local/var/service
    set -gx VISUAL {$EDITOR}

    fish_add_path {$GOPATH}/bin
    fish_add_path {$HOME}/.cargo/bin
    fish_add_path {$HOME}/.local/bin
end
