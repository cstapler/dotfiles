# Load Zplug, clone if not found
if [[ ! -d ~/.zplug ]];then
	curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi


# Start gpg-agent if it's not running
if ! pidof gpg-agent > /dev/null; then
    gpg-agent --homedir $HOME/.gnupg --daemon --sh --enable-ssh-support > $HOME/.gnupg/env
fi
if [ -f "$HOME/.gnupg/env" ]; then
    source $HOME/.gnupg/env
fi
gpg-connect-agent updatestartuptty /bye > /dev/null 2>&1


#NVM Support After script install
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



source ~/.zplug/init.zsh 

ZPLUG_CACHE_DIR="$HOME/.cache/zplug"

# Let Zplug manage itself
zplug "zplug/zplug", hook-build:'zplug --self-manage'

# Theme
zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme

# Plugins
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "plugins/common-aliases", from:oh-my-zsh, as:plugin
zplug "plugins/colored-man-pages", from:oh-my-zsh, as:plugin
zplug "lib/completion", from:oh-my-zsh

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
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Then, source plugins and add commands to $PATH
zplug load --verbose

# Spaceship theme configuration
SPACESHIP_VI_MODE_SHOW=false

# Export Enviroment Variables
source $HOME/.shell/exports.sh

#Add alias for porting dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
