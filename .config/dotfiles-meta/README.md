# Nabaraj's Dotfiles

My personal Linux desktop configuration, heavily optimized for Neovim, Tmux, and the Sway window manager.

## 🛠️ Included Configs
- **Neovim:** Modular setup with native `vim.pack`, LSP, Treesitter, and fuzzy finding.
- **Tmux:** Seamless integration with Neovim.
- **Sway / Foot / Fuzzel / Mako:** Wayland desktop environment.
- **MPV / Yazi:** Media player and terminal file manager.

## 🚀 Installation

To install these dotfiles on a fresh Arch Linux machine:

1. **Clone the repository:**
   ```bash
   git clone --bare git@github.com:nabaraj7/dotfiles.git "$HOME/.dotfiles"
   ```

2. **Checkout the files:**
   ```bash
   alias dotgit='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
   dotgit config --local status.showUntrackedFiles no
   dotgit checkout
   ```

3. **Run the installer:**
   ```bash
   chmod +x ~/.config/dotfiles-meta/install.sh
   ~/.config/dotfiles-meta/install.sh
   ```



