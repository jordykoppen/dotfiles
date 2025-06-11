if not type -q node
    set -gx N_PREFIX $HOME/.local/share/n

    echo "→ node not found, installing now with tj/n"

    brew install n

    n lts
else
    echo "node is already installed."
end
