if not type -q docker
    echo "→ docker not found. Installing now..."
    brew bundle --file=$DOTFILES/docker/Brewfile

    echo "→ Enabling docker/colima at startup"
    brew services start colima

    echo "→ Symlinking docker config"
    ln -sfn $DOTFILES/docker/config.json $HOME/.docker/config.json
else
    echo "docker is already installed."
end
