#!/bin/bash
#When Zsh is not avaiable use use bash-it instead
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh
echo -e "Enter \e[1;31m\`source ~/.bashrc\`\e[0m to finish setup."
