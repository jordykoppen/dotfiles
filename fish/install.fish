fish_add_path $HOMEBREW_PREFIX/bin

if not type -q fish
    echo "→ fish not found. Installing now..."
    brew install fish

    echo "→ fish installed successfully. Adding to shells..."
    sudo echo $HOMEBREW_PREFIX/bin/fish >>/etc/shells

    echo "→ setting fish as the default shell..."
    chsh -s $HOMEBREW_PREFIX/bin/fish
else
    echo "fish is already installed."
end
