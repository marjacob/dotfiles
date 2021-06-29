.SUFFIXES:

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

.PHONY: install
install: $(pkgs)
	$(foreach pkg,$(pkgs),$(call stow,$(pkg)))

.PHONY: reinstall
reinstall:
	$(foreach pkg,$(pkgs),$(call restow,$(pkg)))

.PHONY: uninstall
uninstall:
	$(foreach pkg,$(pkgs),$(call unstow,$(pkg)))

