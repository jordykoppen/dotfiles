set -gx DOTFILES $HOME/dotfiles

for file in (find $DOTFILES -name env.fish -o -name alias.fish)
    source $file
end

# private envs 
source $HOME/env.fish
