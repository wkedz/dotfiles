#!/bin/bash

echo "
alias fd='fdfind'
alias v='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim'

alias zn="zet"
alias zo='cd ${ZET_DIR_PATH} && v && cd -'
alias zg='cd ${ZET_DIR_PATH}'

alias c="clear"

alias ..='cd ..'
alias ....='cd ../..'
alias ......='cd ../../..'
alias ........='cd ../../../..'

# git
#
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gau='git add -u'
alias gaf='git ls-files -m -o --exclude-standard | fzf -m --print0 | xargs -0 -o -t git add -p'

# put current commits into wip
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'

# reset last wip
alias gunwip='git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && git reset HEAD~1'

# Similar to `gunwip` but recursive "Unwips" all recent `--wip--` commits not just the last one
function gunwipall() {
  local _commit
  _commit="$(git log --grep='--wip--' --invert-grep --max-count=1 --format=format:%H)"

  # Check if a commit without "--wip--" was found and it's not the same as HEAD
  if [[ "$_commit" != "$(git rev-parse HEAD)" ]]; then
    git reset "$_commit" || return 1
  fi
}


# pyenv
function get_new_session_name() {
  current_dir_name=$(basename "$(pwd)")
  current_branch_name="$(git branch --show-current 2>/dev/null)"
  if [ "${current_branch_name}" == "" ]; then
    new_session_name="${current_dir_name}"
  else
    new_session_name="${current_dir_name}-${current_branch_name}"
    new_session_name=$(echo "${new_session_name}" | tr '/' '-')
  fi
  echo ${new_session_name}
}

alias pc='pyenv virtualenv $(get_new_session_name)'
alias pa='pyenv activate $(get_new_session_name)'
alias pd='pyenv deactivate'

" >> ~/.bash_aliases
