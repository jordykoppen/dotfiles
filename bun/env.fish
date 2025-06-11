set -x BUN_INSTALL "$HOME/.bun"

if not contains "$BUN_INSTALL/bin" $PATH
    fish_add_path "$BUN_INSTALL/bin"
end
