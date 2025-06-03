set -gx DOTFILES $HOME/dotfiles

# source all envs
source $DOTFILES/**/env.fish

for file in (find $DOTFILES -name install.fish)
    if test -f $file
        echo "Running $file"
        source $file
    else
        echo "File $file not found"
    end
end

source $DOTFILES/init.fish
