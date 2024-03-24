# >>> HOW TO SETUP THE ZSH CUSTOM THEME (cross-platform)
#
# install starship theme for zsh
#   $ curl -sS https://starship.rs/install.sh | sh
#
# install my personal starship customization
#   $ mkdir "$HOME/.config"
#   $ curl -XGET "https://raw.githubusercontent.com/c-neto/ansible-configure-fedora/main/files/dotfiles/starship.toml" > "$HOME/.config/starship.toml"
#
# create zsh plugins directory
#   $ mkdir "$HOME/.my-custom-zsh"
#
# install k alias for kubectl
#   $ curl -XGET "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/kubectl/kubectl.plugin.zsh" > "$HOME/.my-custom-zsh/kubectl.plugin.zsh"
#
# install zsh-syntax-highlighting
#   $ git clone --depth 1 "https://github.com/zsh-users/zsh-syntax-highlighting.git" "$HOME/.my-custom-zsh/zsh-syntax-highlighting"
#
# install zsh-autosuggestions
#   $ git clone --depth 1 "https://github.com/zsh-users/zsh-autosuggestions.git" "$HOME/.my-custom-zsh/zsh-autosuggestions"
#
# [optional] install krew (kubectl extensions manager)
#   https://krew.sigs.k8s.io/docs/user-guide/setup/install/
#
# =======> [!] SETUP FINISHED SUCCESSFULLY :) <=======
#
#
# >>> HOW TO REMOVE THE ZSH CUSTOM THEME
#
# remove starship
#   $ rm "$(command -v 'starship')"
#   $ rm $HOME/.config/starship.toml
#
# remove the custom zsh plugins
#   $ rm -rf $HOME/.my-custom-zsh/
#
# =======> [!] REMOVE FINISHED SUCCESSFULLY :( <=======

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # fix accents (mxkeys keyboard)
    setxkbmap -model pc104 -layout us_intl
fi

# Set the locale of the shell
export LANG="en_US.UTF-8"

# Define VSCode as the default text editor
export EDITOR="code -w"

# Include user-specific binaries and scripts
export PATH="$HOME/.local/bin:$PATH"

# Add Rust binaries to the PATH
export PATH="$PATH:$HOME/.cargo/bin"

# Add Go binaries to the PATH
export PATH="$PATH:$HOME/go/bin"

# system wide cli
export PATH="$PATH:/usr/local/bin"

# Include Krew binaries for managing kubectl plugins
export PATH="$PATH:$HOME/.krew/bin"

# add bundle cli binaries of the rancher desktop
export PATH="$PATH:$HOME/.rd/bin"

# Colorize "kubectl diff" command outputs
export KUBECTL_EXTERNAL_DIFF="colordiff -N -u"

# Specify characters considered as word boundaries for command line navigation
export WORDCHARS=""

# Set the location and filename of the history file
HISTFILE="$HOME/.zsh_history"

# disable CTRL + S and CTRL + Q
stty -ixon

# enable comments "#" expressions in the prompt shell
setopt INTERACTIVE_COMMENTS

# Append new history entries to the history file
setopt APPEND_HISTORY

# Save each command to the history file as soon as it is executed
setopt INC_APPEND_HISTORY

# Ignore recording duplicate consecutive commands in the history
setopt HIST_IGNORE_DUPS

# Ignore commands that start with a space in the history
setopt HIST_IGNORE_SPACE

# Share the command history among multiple Zsh sessions
# setopt SHARE_HISTORY

# Set the maximum number of lines to be saved in the history file
HISTSIZE="100000"
SAVEHIST="$HISTSIZE"

# Load zsh-autosuggestions
source "$HOME/.my-custom-zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"

# Load zsh-syntax-highlighting
source "$HOME/.my-custom-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Enable kubectl plugin autocompletion
autoload -Uz compinit
compinit
source "$HOME/.my-custom-zsh/kubectl.plugin.zsh"
# source <(kubectl completion zsh)

# Start Starship prompt
eval "$(starship init zsh)"

# >>> bindkey tip: to discovery the code of your keys, execute "$ cat -v" and press the key, the code will be printed in your shell.

# Navigate words using Ctrl + arrow keys
# >>> CRTL + right arrow | CRTL + left arrow
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Search history using Up and Down keys
# >>> up arrow | down arrow
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Jump to the start and end of the command line
# >>> CTRL + A | CTRL + E
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
# >>> Home | End
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Navigate menu for command output
zstyle ':completion:*:*:*:*:*' menu select
bindkey '^[[Z' reverse-menu-complete

# Delete characters using the "delete" key
bindkey "^[[3~" delete-char
