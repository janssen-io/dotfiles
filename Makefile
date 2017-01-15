# Credits to github.com/mrkite/dotfiles
.DEFAULT_GOAL:=install

PKGS=`ls -d */`

.PHONY: install
install:
	stow -t ~ $(PKGS)
	xrdb ~/.Xresources


.PHONY: uninstall
uninstall:
	stow -Dt ~ $(PKGS)

.PHONY: update
update: pull install

.PHONY: pull
pull:
	git pull
