# My personal dotfiles

My personal dot files. Im following Fatih's idea of [dotfiles](https://github.com/fatih/dotfiles). 
I can only recommend his repository as a source of inspiration :) 

I'm preffering `zsh` and `neoVim` over `Vim`. I didn't test my configuration on Vim or other shell.


## A new machine

```
# clone the repo into ${HOME}/dotfiles
git clone https://github.com/sn3d/dotfiles ~/dotfiles

# make a symlinks to dotiles
cd ~/dotfiles
make
```

### Install neovim

You have to manually open the `vim` or `nvim` and install plugins with
```
:PlugInstall
```


### Install tmux
Also you have to manully install tmux plugins. 

```
make install-tmux
tmux source ~/.tmux.conf
```

Run the `tmux` and press `ctrl+b` and I capital 'i'.

