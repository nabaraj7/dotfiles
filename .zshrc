# Non-interactive exit
[[ $- != *i* ]] && return

# Env
export EDITOR=nvim VISUAL=nvim
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# History
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_REDUCE_BLANKS HIST_IGNORE_SPACE

# Completion
_zcache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
[[ -d $_zcache ]] || mkdir -p "$_zcache"
zmodload zsh/complist
autoload -Uz compinit
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$_zcache/zcompcache"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
compinit -C -d "$_zcache/zcompdump-${ZSH_VERSION}"

# Keybindings
bindkey -e
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^F' autosuggest-accept
bindkey -M menuselect '^I' menu-complete
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Aliases
alias bp='nvim ~/.zshrc'
alias sa='source ~/.zshrc'
alias ls='eza --icons=auto --group-directories-first'
alias cat='bat'
alias ac='aria2c -s 16 -x 16'
alias dotgit='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Prompt
autoload -Uz vcs_info add-zsh-hook
add-zsh-hook precmd vcs_info
zstyle ':vcs_info:git:*' formats '%b '
zstyle ':vcs_info:git:*' check-for-changes false
setopt PROMPT_SUBST

PROMPT='%F{green}%n%f %F{blue}%~%f %(?.%F{green}.%F{red})❯%f '
RPROMPT='%F{red}${vcs_info_msg_0_}%f %F{8}%D{%H:%M}%f'

# Plugins
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'
ZSH_AUTOSUGGEST_STRATEGY=(history)
[[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
