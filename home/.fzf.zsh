# Setup fzf
# ---------
if [[ ! "$PATH" == */home/agent/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/agent/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/agent/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/agent/.fzf/shell/key-bindings.zsh"
