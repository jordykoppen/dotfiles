if status is-interactive
    # init dotfiles
    $HOME/dotfiles/init.fish

    atuin init fish | source
    starship init fish | source
    source /opt/homebrew/share/fish/vendor_completions.d/*
end
