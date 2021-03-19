all: sync

sync:
	mkdir -p ~/.config/nvim
	[ -d ~/.vim/bundle/Vundle.vim ] || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	[ -f ~/.config/nvim/init.vim ] || ln -s $(PWD)/init.vim ~/.config/nvim/init.vim
	[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
	[ -f ~/.tmux.conf ] || ln -s $(PWD)/tmux.conf ~/.tmux.conf

clean: 
	rm -f ~/.vimrc
	rm -rf ~/.vim
	rm -f ~/.config/nvim/init.vim
	rm -f ~/.tmux.conf

.PHONY: all clean sync