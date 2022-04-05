.SUFFIXES:

GIT_THREADS ?= 4

define restow
stow --restow "$1"

endef

define stow
stow "$1"

endef

define unstow
stow --delete "$1"

endef

dirs := $(sort $(dir $(wildcard ./*/)))
pkgs := $(dirs:./%/=%)

.PHONY: all
all: $(pkgs)
	$(foreach pkg,$(pkgs),$(info $(pkg)))
	@:

.PHONY: init
init: init-submodules update-nvim-helptags

.PHONY: init-submodules
init-submodules:
	git submodule update --init --jobs $(GIT_THREADS) --recursive

.PHONY: install
install: $(pkgs)
	$(foreach pkg,$(pkgs),$(call stow,$(pkg)))

.PHONY: reinstall
reinstall:
	$(foreach pkg,$(pkgs),$(call restow,$(pkg)))

.PHONY: reset-master
reset-master:
	git fetch --all
	git reset --hard origin/master

.PHONY: uninstall
uninstall:
	$(foreach pkg,$(pkgs),$(call unstow,$(pkg)))

.PHONY: update
update: update-repository update-submodules update-nvim-helptags
	git status

.PHONY: update-force
update-force: reset-master update

.PHONY: update-nvim-helptags
update-nvim-helptags:
	nvim --headless -c "helptags ALL" -c q

.PHONY: update-repository
update-repository:
	git pull --autostash --rebase

.PHONY: update-submodules
update-submodules:
	git submodule update --init --jobs $(GIT_THREADS) --remote

