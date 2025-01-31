
eval "$(starship init zsh)"

# zsh plugins
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# Yazi
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ 1 -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source /Users/lemuelguevara/.docker/init-zsh.sh || true # Added by Docker Desktop
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="$HOME/.local/bin":$PATH

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Flutter PATH
export PATH="$PATH:/Users/lemuelguevara/Developer/flutter/bin"

# Java Paths
export PATH=$JAVA_HOME/bin:$PATH
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
export JAVA_17_HOME=$(/usr/libexec/java_home -v17)
export JAVA_19_HOME=$(/usr/libexec/java_home -v19)

alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'
alias java17='export JAVA_HOME=$JAVA_17_HOME'
alias java19='export JAVA_HOME=$JAVA_19_HOME'

# default to Java 11
java11

# bun completions
[ -s "/Users/lemuelguevara/.bun/_bun" ] && source "/Users/lemuelguevara/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# fnm
FNM_PATH="/Users/lemuelguevara/Library/Application Support/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/Users/lemuelguevara/Library/Application Support/fnm:$PATH"
  eval "`fnm env`"
fi
eval "$(fnm env --use-on-cd --shell zsh)"

# eza alias
alias ls='eza --icons -l'

# zoxide
eval "$(zoxide init zsh)"

# fzf preview
alias inv='nvim $(fzf --preview="bat --color=always {}")'

# chromdriver
export PATH=$PATH:/opt/homebrew/bin/chromedriver

export PATH="/Users/lemuelguevara/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/Users/lemuelguevara/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/lemuelguevara/.lmstudio/bin"
