function dcrebuild
dc stop $argv; dc build $argv; dc up -d $argv;
end
