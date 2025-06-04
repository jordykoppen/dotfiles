set -gx DOTFILES $HOME/dotfiles

# source all envs
source $DOTFILES/**/env.fish

for file in (find $DOTFILES -name install.fish)
  source $file
end

function fish_greeting
    fastfetch
end

funcsave fish_greeting