if status is-interactive
    atuin init fish | source
    starship init fish | source
    source /opt/homebrew/share/fish/vendor_completions.d/*
end
