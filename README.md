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

You have to manually install vim plugins with
```
vim +PluginInstall
```

Also you have to manully install tmux plugins. Run the `tmux` and press `ctrl+b` and I capital 'i'.
