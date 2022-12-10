set --erase fish_greeting

if status is-interactive
  atuin init fish | source
  starship init fish | source
end

bind \cg 'git diff; commandline -f repaint'

# bun
set -Ux BUN_INSTALL "/Users/jordykoppen/.bun"
fish_add_path "/Users/jordykoppen/.bun/bin"
rvm default
