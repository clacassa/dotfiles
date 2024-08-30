# Setup fzf
# ---------
if [[ ! "$PATH" == */home/cygne/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/cygne/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/cygne/.fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/home/cygne/.fzf/shell/key-bindings.zsh"
