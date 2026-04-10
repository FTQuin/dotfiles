# Common Actions

## for pushing dotfiles into the real world

```bash
stow <package-name>
```
e.g. stow nvim

## for pulling dotfiles from the real world

```bash
stow <package-name or file> --adopt
```
e.g. stow <package-name> --adopt

## for brew package management

```bash
brew list > brew_list.txt
```

```bash
brew install $(cat brew_list.txt)
```
