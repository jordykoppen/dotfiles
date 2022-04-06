# COMMAND EXAMPLE:
# aliasadd TYPE ALIAS CMD

function aliasadd
  set FOLDER $argv[1]
  set ALIAS $argv[2]
  set CMD $argv[3]

  echo alias $ALIAS=\"$CMD\" >> $DOTFILES/$FOLDER/alias.fish
end
