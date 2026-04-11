# Common Actions

## for pushing dotfiles into the real world

```bash
stow --dotfiles <package-name>
```
e.g. stow --dotfiles nvim

## for pulling dotfiles from the real world

```bash
stow --dotfiles <package-name> --adopt
```
e.g. stow --dotfiles nvim --adopt

## for brew package management

```bash
brew list > brew_list.txt
```

```bash
brew install $(cat brew_list.txt)
```
