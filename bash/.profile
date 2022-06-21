export VISUAL=vim
export EDITOR=${VISUAL}
export PATH=${HOME}/.local/bin:${PATH}

import() {
  if [ -f "${1}" ]; then
    . "${1}"
  fi
}

import "${HOME}/.cargo/env"
