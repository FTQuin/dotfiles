# ---- TITLE ----
sleep 0.1
neofetch --loop --iterm2 ~/dotfiles/start_up_image/trailer_roof.jpeg --size 820px

# ---- Powerlevel10k -----
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ---- history setup -----
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ---- auto completions -----
autoload -Uz compinit && compinit

# ---- terminal suggestions and highlighting -----
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# ---- NVM -----
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# ---- Eza (better ls) -----
alias ls="eza --git --header --icons=always"

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"
alias cd="z"

# ---- Bat ----
alias cat="bat"

# ---- FZF ----
source <(fzf --zsh)
source ~/fzf-git.sh

# ---- Re Alias' ----
alias la="ls -a"
alias ll="ls -l"
alias l="ls"

alias gst="git status"
alias gcm="git commit -m"
alias ga="git add"


# ---- OLD TITLE ----
# echo "                                                                             "
# echo "                                                                             "
# echo "\u001b[38;2;253;104;50m ██████   ██████                    ███████████                    █████     \033[0m"
# echo "\u001b[38;2;251;108;50m░░██████ ██████                    ░░███░░░░░███                  ░░███      \033[0m"
# echo "\u001b[38;2;249;112;50m ░███░█████░███   ██████    ██████  ░███    ░███  ██████   ██████  ░███ █████\033[0m"
# echo "\u001b[38;2;247;116;50m ░███░░███ ░███  ░░░░░███  ███░░███ ░██████████  ███░░███ ███░░███ ░███░░███ \033[0m"
# echo "\u001b[38;2;245;120;50m ░███ ░░░  ░███   ███████ ░███ ░░░  ░███░░░░░███░███ ░███░███ ░███ ░██████░  \033[0m"
# echo "\u001b[38;2;243;124;50m ░███      ░███  ███░░███ ░███  ███ ░███    ░███░███ ░███░███ ░███ ░███░░███ \033[0m"
# echo "\u001b[38;2;241;128;50m █████     █████░░████████░░██████  ███████████ ░░██████ ░░██████  ████ █████\033[0m"
# echo "\u001b[38;2;239;132;50m░░░░░     ░░░░░  ░░░░░░░░  ░░░░░░  ░░░░░░░░░░░   ░░░░░░   ░░░░░░  ░░░░ ░░░░░ \033[0m"
# echo "\u001b[38;2;237;136;50m                                                                             \033[0m"
# echo "\u001b[38;2;235;140;50m                                                                             \033[0m"
# echo "\u001b[38;2;233;144;50m                                                                             \033[0m"
# echo "\u001b[38;2;231;148;50m ███████████                                                                 \033[0m"
# echo "\u001b[38;2;229;152;50m░░███░░░░░███                                                                \033[0m"
# echo "\u001b[38;2;227;156;50m ░███    ░███ ████████   ██████                                              \033[0m"
# echo "\u001b[38;2;225;160;50m ░██████████ ░░███░░███ ███░░███                                             \033[0m"
# echo "\u001b[38;2;223;164;50m ░███░░░░░░   ░███ ░░░ ░███ ░███                                             \033[0m"
# echo "\u001b[38;2;221;168;50m ░███         ░███     ░███ ░███                                             \033[0m"
# echo "\u001b[38;2;219;172;50m █████        █████    ░░██████                                              \033[0m"
# echo "\u001b[38;2;217;176;50m░░░░░        ░░░░░      ░░░░░░                                               \033[0m"
# echo "                                                                             "
# echo "                                                                             "
