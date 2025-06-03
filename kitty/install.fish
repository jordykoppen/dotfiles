if not type -q kitty
    echo "→ kitty not found. Installing now..."

    brew install kitty
else
    echo "kitty is already installed."
end
