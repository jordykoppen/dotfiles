set --erase fish_greeting

if status is-interactive
#   atuin init fish | source
  starship init fish | source
# source (/opt/homebrew/bin/starship init fish --print-full-init | psub)
end


# pnpm
set -gx PNPM_HOME /Users/jordykoppen/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

source "$(brew --prefix)/share/google-cloud-sdk/path.fish.inc"
