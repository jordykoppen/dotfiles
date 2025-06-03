if not type -q atuin
    echo "→ atuin not found. Installing atuin now..."
    brew install atuin
    echo "→ atuin installed successfully. Generating completions..."
    atuin gen-completions --shell fish | source
    echo "→ Completions generated successfully."
else
    echo "atuin is already installed."
end
