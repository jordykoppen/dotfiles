if not type -q eza
    echo "→ eza (ls replacement) not found. Installing now..."

    brew install eza
else
    echo "eza (ls replacement) is already installed."
end
