# 自作コマンドへパスを通す
export PATH=$(chezmoi source-path)/_/bin:$PATH

# asdf
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# rmをゴミ箱に
alias rm='trash'

# カーソルから行頭までの文字を削除
bindkey "^u" backward-kill-line