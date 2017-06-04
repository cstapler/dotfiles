

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
zplug "plugins/common-aliases", from:oh-my-zsh, as:plugin

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
 printf "Install? [y/N]: "
 if read -q; then
  echo; zplug install
 fi
fi

# Then, source plugins and add commands to $PATH
 zplug load --verbose

