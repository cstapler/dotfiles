

# Load Zplug, clone if not found
if [[ ! -d ~/.zplug ]];then
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

source ~/.zplug/init.zsh 

ZPLUG_CACHE_DIR="$HOME/.cache/zplug"

# Let Zplug manage itself
zplug "zplug/zplug", hook-build:'zplug --self-manage'

# Theme
zplug "themes/arrow", from:oh-my-zsh, as:theme

# Plugins
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "plugins/common-aliases", from:oh-my-zsh, as:plugin

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
 printf "Install? [y/N]: "
 if read -q; then
  echo; zplug install
 fi
fi

# Enable ZSH Vi Mode
bindkey -v

# Key binding for entering ommand line editing
autoload -U edit-command-line

# Key bindings for substring history search
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-downstring plugin bindings
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Then, source plugins and add commands to $PATH
 zplug load --verbose

