#!/bin/bash

echo '
# pretty cli 
# installed by pretty-cli.sh
BLUE="\[\033[01;34m\]"
GREEN="\[\033[01;32m\]"
NORMAL="\[\033[0m\]"
RED="\[\033[31;1m\]"
RESET="\[\017\]"
WHITE="\[\033[37;1m\]"
YELLOW="\[\033[33;1m\]"

OK="${GREEN} \$? ${NORMAL}"
ERROR="${RED} \$? ${NORMAL}"
STATUS="if [ \$? = 0 ]; then echo \"${OK}\"; else echo \"${ERROR}\"; fi"
export PS1="${RESET}${GREEN}\u@${YELLOW}\h\`${STATUS}\`:${BLUE}\w\n${WHITE}\$(__git_ps1) ${NORMAL}$ "
' >> ~/.bashrc
