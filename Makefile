UNAME := $(shell uname -s | tr A-Z a-z)

all: sync

install: install-$(UNAME) install-tmux-tpm

install-darwin:
	brew insall neovim

install-linux:
	apt install neovim

install-tmux-tpm:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

sync:
	mkdir -p ~/.config/nvim
	[ -d ~/.vim/bundle/Vundle.vim ] || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	[ -f ~/.config/nvim/init.vim ] || ln -s $(PWD)/init.vim ~/.config/nvim/init.vim
	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux.conf ~/.tmux.conf
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig

clean: 
	rm -f ~/.vimrc
	rm -rf ~/.vim
	rm -f ~/.config/nvim/init.vim
	rm -f ~/.tmux.conf
	rm -f ~/.gitconfig

.PHONY: all clean sync install install-darwin install-linux install-tmux-tpm
