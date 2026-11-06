# Exit if not interactive
[[ $- != *i* ]] && return

# --- Environment Variables ---
export EDITOR=nvim
export VISUAL=nvim
# Add local bin directories to PATH (crucial for Rust/Go/Cargo tools later)
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$HOME/go/bin:$PATH"

# --- History ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_REDUCE_BLANKS HIST_IGNORE_SPACE

# --- Completion ---
_zcache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
[[ -d $_zcache ]] || mkdir -p "$_zcache"

zmodload zsh/complist
autoload -Uz compinit
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$_zcache/zcompcache"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select
compinit -C -d "$_zcache/zcompdump-${ZSH_VERSION}"

# --- FZF ---
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
fi

# --- Keybindings ---
bindkey -e
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A'    up-line-or-beginning-search
bindkey '^[[B'    down-line-or-beginning-search
bindkey '^[[C'    forward-char
bindkey '^F'      autosuggest-accept
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey -M menuselect '^I'    menu-complete
bindkey -M menuselect '^[[Z'  reverse-menu-complete

# --- Aliases ---
alias ac='aria2c -s 16 -x 16'
alias bp='nvim ~/.zshrc'
alias sa='source ~/.zshrc' # Changed to source instead of exec zsh to prevent closing window
alias ls='eza --icons=auto'
alias cat='bat'
alias dotgit='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# --- Prompt (Pure Zsh) ---
autoload -Uz vcs_info add-zsh-hook
add-zsh-hook precmd vcs_info
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST

# Time on right, path and user on left
PROMPT='%F{green}%n%f %F{blue}%~%f %(?.%F{green}.%F{red})❯%f '
RPROMPT='%F{red}${vcs_info_msg_0_}%f %F{8}%D{%H:%M}%f'

# --- Plugins (Keep LAST) ---
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

if [[ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
