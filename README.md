# Common Actions

## for pushing dotfiles into the real world

stow .

## for pulling dotfiles from the real world

stow . --adopt

## for brew package management

brew list > .brew_list.txt
brew install $(cat .brew_list.txt)
