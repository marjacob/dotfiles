import() {
  if [ -f "${1}" ]; then
    . "${1}"
  fi
}

search() {
  if [ -d "${1}" ]; then
    export PATH=${1}:${PATH}
  fi
}

export BROWSER=firefox
export CC=clang
export CXX=clang++
export EDITOR=vim
export GOPATH=${HOME}/.go
export PREFIX=${HOME}/.local
export SVDIR=${HOME}/.local/var/service
export VISUAL=${EDITOR}

search "${GOPATH}/bin"
search "${HOME}/.cargo/bin"
search "${HOME}/.local/bin"

import "${HOME}/.cargo/env"
import "${HOME}/.profile.local"
