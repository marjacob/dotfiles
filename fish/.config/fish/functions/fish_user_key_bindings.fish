function fish_user_key_bindings
    # Use Vi mode.
    # https://fishshell.com/docs/current/interactive.html#visual-mode
    fish_vi_key_bindings

    # Use jk as an alternative escape sequence.
    # https://stackoverflow.com/a/49040911
    for mode in insert visual
        bind -M $mode -m default jk backward-char force-repaint
    end

    # Use Ctrl-O to accept autosuggestions.
    # https://github.com/fish-shell/fish-shell/issues/3541
    for mode in default insert visual
        bind -M $mode \co forward-char
    end
end
