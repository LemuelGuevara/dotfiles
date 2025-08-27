starship init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end
  
# --- Yazi function ---
function yy
    set -l tmp (mktemp -t yazi-cwd.XXXXXX)
    yazi $argv --cwd-file=$tmp
    set -l cwd (cat $tmp)
    if test -n "$cwd"
        and test "$cwd" != (pwd)
        cd $cwd
    end
    rm -f $tmp
end

# --- Locale settings ---
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8

# --- PATH adjustments ---
set -x PATH /opt/homebrew/opt/llvm/bin $PATH
set -x PATH $HOME/.local/bin $PATH

# Export
# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/lemuelguevara/.lmstudio/bin
set -x HOMEBREW_NO_AUTO_UPDATE 1
set -x EDITOR nvim

# --- Bun completions and PATH ---
set -x BUN_INSTALL $HOME/.bun
if functions -q fish_add_path
    fish_add_path $BUN_INSTALL/bin
else
    set -x PATH $BUN_INSTALL/bin $PATH
end

# --- fzf preview alias ---
function inv
    nvim (fzf --preview "bat --color=always {}")
end

if functions -q fish_add_path
    fish_add_path $HOME/.pub-cache/bin --append
    fish_add_path /opt/homebrew/opt/postgresql@17/bin
else
    set -x PATH $PATH $HOME/.pub-cache/bin
    set -x PATH /opt/homebrew/opt/postgresql@17/bin $PATH
end


set -x XDG_CONFIG_HOME "$HOME/.config"

# pnpm
set -gx PNPM_HOME "/Users/lemuelguevara/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end


# Exa
function ll 
  exa -l --icons
end


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
set -gx MAMBA_EXE "/opt/homebrew/bin/mamba"
set -gx MAMBA_ROOT_PREFIX "/Users/lemuelguevara/.local/share/mamba"
$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
alias mamba micromamba
mamba activate base
# <<< mamba initialize <<<
