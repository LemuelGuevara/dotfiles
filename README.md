# My dotfiles :gear:

Dotfiles configuration across unix based systems e.g. macos and linux

## Tmux + Neovim :tea:
<img width="1772" height="1116" alt="Screenshot 2025-08-27 at 20 52 51" src="https://github.com/user-attachments/assets/116e8829-c8cc-4861-999b-6a86a89e417d" />


## Config setup

- **Terminal:** wezterm
- **Shell:** fish with starship
- **Text-editor:** neovim
- **Multiplexer:** tmux

## Requirements

- git
- stow
- neovim
- fish

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
