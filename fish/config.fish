set --erase fish_greeting

if status is-interactive
  atuin init fish | source
  starship init fish | source
end

