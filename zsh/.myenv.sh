

####################################################################################
# fzf (fuzzy finder)
# You can add these options to $FZF_DEFAULT_OPTS so that they're applied by default
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
# Default command to use when input is tty

export FZF_DEFAULT_COMMAND='fd --type f'

# Options to fzf command
export FZF_COMPLETION_OPTS='+c -x'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# (EXPERIMENTAL) Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    *)            fzf "$@" ;;
  esac
}

####################################################################################
# zsh-autosuggestions
# this would show suggestions with bold, underlined, pink text on a cyan background:
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"
#Suggestion Strategy
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

