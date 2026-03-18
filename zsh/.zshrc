# Включаем автодополнение (Tab)
autoload -Uz compinit
compinit

# Настройка истории (чтобы fzf было что искать)
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Те самые плагины и FZF (уже должны быть у тебя)
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(starship init zsh)"

# Безопасное удаление
alias rm='gtrash put'
# Посмотреть, что в корзине
alias tl='trash-list'
# Восстановить файл
alias restore='trash-restore'

alias dotsync='cd ~/dotfiles && git add . && git commit -m "update configs" && git push origin main && cd -'

export MOZ_ENABLE_WAYLAND=1
