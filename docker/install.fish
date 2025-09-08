if not type -q docker
    echo "→ docker not found. Installing now..."
    brew bundle --file=$DOTFILES/docker/Brewfile

    echo "→ Symlinking docker config"
    ln -sfn $DOTFILES/docker/config.json $HOME/.docker/config.json
else
    echo "docker is already installed."
end
