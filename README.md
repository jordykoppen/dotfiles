# Dotfiles

This repository contains my personal dotfiles and configuration files for various tools and applications. It's designed to make setting up my personal environment autommated and painless

## What's Included

- 🐟 Fish Shell configuration
- 🐱 Kitty terminal configuration
- 🐙 Git configuration
- 🐳 Docker configuration
- 📦 Package managers:
  - npm
  - pnpm
  - bun
- 🎨 Neovim configuration
- ⌨️ Keyboard configurations
  - QMK Firmware
    - planck
    - preonic
    - keychron Q2
    - keychron Q8
    - cornelius
  - ZMK Firmware
    - crkbd
    - blank slate (wireless planck)
  - Automated builds via GitHub Actions
- 🔑 SSH configuration
- ⭐ Starship prompt configuration
- 📝 Atuin shell history
- 🐙 GitHub CLI configuration
- 🍺 Homebrew configuration

## Prerequisites

- macOS (tested on macOS 23.6.0)
- [Fish Shell](https://fishshell.com/)
- [Homebrew](https://brew.sh/)

## Installation

1. Run the remote install script from the terminal:
   ```bash
    curl -fsSL https://raw.githubusercontent.com/jordykoppen/dotfiles/refs/heads/main/setup_scripts/remote_install | bash
   ```

## Structure

```
dotfiles/
├── alias.fish        # Fish shell aliases
├── install.fish      # Main installation script
├── setup_scripts/    # Additional setup scripts
├── fish/            # Fish shell configuration
├── kitty/           # Kitty terminal configuration
├── git/             # Git configuration
├── npm/             # npm configuration
├── node/            # Node.js configuration
├── pnpm/            # pnpm configuration
├── nvim/            # Neovim configuration
├── brew/            # Homebrew configuration
├── docker/          # Docker configuration
├── keyboards/       # Keyboard configurations
├── gh/              # GitHub CLI configuration
├── ssh/             # SSH configuration
├── bun/             # Bun configuration
├── atuin/           # Atuin shell history configuration
└── starship/        # Starship prompt configuration
```

## Customization

Each component has its own directory with specific configuration files. You can modify these files to suit your preferences. The main installation script will automatically pick up any changes when you run it again.

## Contributing

Feel free to fork this repository and customize it for your own use. If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

This project is open source and available under the MIT License.

