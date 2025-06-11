source $HOME/dotfiles/env.fish

for file in $DOTFILES/**/env.fish $DOTFILES/**/install.fish
    source $file
end

function fish_greeting
    fastfetch
end
funcsave fish_greeting

# Set the git remote for $HOME/dotfiles
git -C $HOME/dotfiles remote rm origin
git -C $HOME/dotfiles remote add origin git@github.com:jordykoppen/dotfiles.git