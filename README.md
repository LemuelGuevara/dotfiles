## dotfiles configuration

dotfiles configuration across unix based systems e.g. macos and linux

## Tmux + Neovim

![[Screenshot 2024-08-06 at 21.54.10.png]]

## Config setup

- **Terminal:** wezterm
- **Shell:** zsh with starship
- **Text-editor:** neovim
- **Multiplexer:** tmux

## Requirements

- git
- stow
- neovim

## Installation

Clone the repository:

```bash
git clone https://github.com/LemuelGuevara/dotfiles.git ~/dotfiles
```

Stow afterwards to apply symlinks:

```bash
cd ~/dotfiles
stow --adopt .
```

> [!CAUTION]  
> This will overwrite your existing configs.

## Post installation

- Neovim
  - Open to install packages
- Tmux
  - Open a new tmux session
  - `ctrl + r then shift + i` to install the plugins

And all good to go!
