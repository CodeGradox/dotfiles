# Global environment variables.
set -gx FZF_DEFAULT_COMMAND 'fd -t f --hidden -E ".git"'
set -gx XKB_DEFAULT_LAYOUT no
set -gx EDITOR 'nvim'
set -gx RAILS_ENV 'development'
set -gx MOZ_ENABLE_WAYLAND 1
set -gx MOZ_DBUS_REMOTE 1
set -gx XDG_SESSION_TYPE 'wayland'
set -gx BAT_THEME 'OneHalfLight'
set -gx npm_config_prefix '~/.config/node_modules'

# Load aliases.
source $HOME/.config/fish/aliases.fish

# Colors.
set fish_color_autosuggestion grey
set fish_pager_color_prefix brred
set fish_pager_color_completion --bold brblack

status --is-interactive; and source (rbenv init -|psub)

# Enable FZF keybindings.
function fish_user_key_bindings
  fzf_key_bindings
end

# Disables the default fish greeting.
function fish_greeting; end
