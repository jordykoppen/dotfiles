if not type -q pnpm >/dev/null
    echo "→ pnpm not found, enabling via corepack"

    # Due to an issue with outdated signatures in Corepack, Corepack should be updated to its latest version first:
    npm install --global corepack@latest

    corepack enable pnpm
else
    echo "pnpm is already installed."
end
