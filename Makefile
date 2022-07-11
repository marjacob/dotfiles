.SUFFIXES:

BUNDLE_FILE ?= $(notdir $(CURDIR)).tar.gz
GIT_THREADS ?= 4

define restow
stow --target "${HOME}" --restow "$1"

endef

define stow
stow --target "${HOME}" --stow "$1"

endef

define unstow
stow --target "${HOME}" --delete "$1"

endef

dirs := $(sort $(dir $(wildcard */)))
pkgs := $(dirs:%/=%)

.PHONY: all
all: $(pkgs)
	$(foreach pkg,$(pkgs),$(info $(pkg)))
	@:

.PHONY: bundle
bundle: $(BUNDLE_FILE)

.PHONY: clean
clean:
	$(RM) "$(BUNDLE_FILE)"

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

.PHONY: $(BUNDLE_FILE)
$(BUNDLE_FILE):
	touch "$(BUNDLE_FILE)"
	tar \
		--create \
		--directory=".." \
		--exclude-vcs \
		--exclude="$(BUNDLE_FILE)" \
		--file="$(BUNDLE_FILE)" \
		--gzip \
		"$(notdir $(CURDIR))"
