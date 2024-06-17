#!/bin/bash

cp ../git/git-prompt.sh ~/.local/bin/
cp ../git/git-completion.bash ~/.local/bin/

echo "
# git
## installed by install_git_completion.sh
## Load __git_ps1 and autocompletion
## https://git-scm.com/book/uz/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Bash

. ~/.local/bin/git-completion.bash
. ~/.local/bin/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
" >> ~/.bashrc
