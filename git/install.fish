if not type -q lazygit
    echo "→ lazygit not found. Installing now..."

    brew install lazygit
else
    echo "lazygit is already installed."
end
