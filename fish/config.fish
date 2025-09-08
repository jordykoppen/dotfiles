if status is-interactive
    atuin init fish | source
    starship init fish | source
    source /opt/homebrew/share/fish/vendor_completions.d/*
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
