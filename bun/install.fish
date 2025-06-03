if not type -q bun
    echo "→ bun not found. Installing bun now..."
    brew install oven-sh/bun/bun
else
    echo "→ bun is already installed."
end
