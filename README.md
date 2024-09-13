# Common Actions
stow .
brew list > .brew_list.txt
brew install $(cat .brew_list.txt)
