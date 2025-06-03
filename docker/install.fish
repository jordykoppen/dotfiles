if not type -q docker
    echo "→ docker not found. Installing now..."

    brew install docker docker-compose lazydocker colima
    # Enable docker/colima at startup
    brew services start colima

    # enable "docker compose" command
    mkdir -p $HOME/.docker/cli-plugins
    ln -sfn $HOMEBREW_PREFIX/opt/docker-compose/bin/docker-compose $HOME/.docker/cli-plugins/docker-compose
else
    echo "docker is already installed."
end
