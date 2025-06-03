if not type -q starship
    echo "→ starship not found. Install now..."
    brew install starship
else
    echo "starship is already installed."
end
