set -x DOTFILES $HOME/dotfiles

for file in $DOTFILES/**/env.fish $DOTFILES/**/alias.fish
    source $file
end

# private envs 
source $HOME/env.fish
