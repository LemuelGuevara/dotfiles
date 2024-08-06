# My dotfiles :gear:

dotfiles configuration across unix based systems e.g. macos and linux

## Tmux + Neovim :tea:
`i know its quite boring, but i am a minimal person`
![Screenshot 2024-08-06 at 21 54 10](https://github.com/user-attachments/assets/dd4bf4b2-d3d9-4aaf-9495-ccd25c1fc8b2)

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

- **Neovim**
  - Open to install packages
- **Tmux**
  - Open a new tmux session
  - `ctrl + r then shift + i` to install the plugins

And all good to go!
