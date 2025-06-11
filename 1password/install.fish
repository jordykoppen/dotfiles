if not type -q op
    echo "→ 1Password (CLI) not found. Installing 1Password and CLI now..."
    echo "→ Installing 1Password"
    brew install --cask 1password
    echo "→ Installing 1Password CLI"
    brew install --cask 1password-cli
    
    echo ""
    echo "→ Let's set up 1Password and the CLI now for the first time."
    echo ""
    echo "→ Press enter to open 1Password and log in to your account."
    read -l
    open -a 1Password

    echo ""
    echo "→ Press enter once you have logged in and enabled the developer integrations."
    read -l 
    echo "→ 1Password is now set up and ready to use."

    echo ""
    echo "→ Now let's sign in to the 1Password CLI. Press enter to when you are ready."
    read -l 

    op signin
    read -l 
    echo "→ Press enter once you have logged in"

    echo ""
    echo "→ 1Password CLI is now set up and ready to use."
else
    echo "1Password  is already installed."
end
