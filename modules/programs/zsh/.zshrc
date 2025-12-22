# ----------------------------------------
# 1. Setup
# ----------------------------------------

# ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="fino-time"

plugins=(
	zsh-autosuggestions
	zsh-syntax-highlighting
)
if type brew &>/dev/null; then
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

# zsh settings
setopt autocd # cdコマンドの省略
setopt autopushd # cd時にディレクトリをスタックに積む
setopt correct # コマンドのスペルミスを訂正
setopt histignoredups # 重複したコマンドは履歴に残さない
setopt histignorespace # 行頭にスペースがあるコマンドは履歴に残さない
setopt histreduceblanks # 余分なスペースは削除して履歴に残す
setopt histsavenodups # 重複したコマンドは履歴に残さない
setopt sharehistory # コマンドの履歴を共有する

# autoload -Uz compinit && compinit

# ----------------------------------------
# 2. Aliases
# ----------------------------------------

# default
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias ls="eza"
alias la="eza -AF"
alias ll="eza -AlhF"
alias grep="rg"

# others
alias vim="nvim"
alias suvim="sudo -E nvim "

alias apply-wsl="nix run .#homeConfigurations.wsl.activationPackage"
alias apply-mac="nix run .#homeConfigurations.macos.activationPackage"

# ----------------------------------------
# 3. environment variables
# ----------------------------------------
export PATH="$PATH:$HOME/.local/bin"

# Rust
export PATH="$PATH:$HOME/.cargo/bin"

# Go
export PATH="$PATH:/usr/local/go/bin"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Other
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$HOME/.rd/bin:$PATH"

# ----------------------------------------
# 4. Others
# ----------------------------------------