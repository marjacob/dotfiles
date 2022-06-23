export BROWSER=firefox
export CC=clang
export CXX=clang++
export EDITOR=vim
export PATH=${HOME}/.local/bin:${PATH}
export SVDIR=${HOME}/.local/var/service
export VISUAL=${EDITOR}

import() {
  if [ -f "${1}" ]; then
    . "${1}"
  fi
}

import "${HOME}/.cargo/env"
