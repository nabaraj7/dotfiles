#!/usr/bin/env bash
# install.sh - Dotfiles Installer

set -euo pipefail

DOTFILES_DIR="$HOME/.dotfiles"
CONFIG_DIR="$HOME/.config"

echo "🚀 Starting dotfiles installation..."

# --- 1. Install System Dependencies (Arch Linux) ---
if command -v pacman &> /dev/null; then
    echo "📦 Installing system dependencies via pacman..."
    sudo pacman -S --needed --noconfirm \
        neovim tmux fzf ripgrep fd stylua clang tree-sitter-cli \
        nodejs npm python-pyright ruff \
        sway foot fuzzel mpv mako yazi \
        git wget curl unzip
else
    echo "⚠️ pacman not found. Skipping system dependencies."
fi

# --- 2. Install TPM (Tmux Plugin Manager) ---
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "🔌 Installing Tmux Plugin Manager (TPM)..."
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
else
    echo "✅ TPM already installed."
fi

# --- 3. Symlink Configurations ---
link_file() {
    local src="$1"
    local dest="$2"

    if [ -e "$dest" ] && [ ! -L "$dest" ]; then
        echo "📦 Backing up existing $dest to ${dest}.bak"
        mv "$dest" "${dest}.bak"
    fi

    echo "🔗 Linking $src -> $dest"
    ln -sfn "$src" "$dest"
}

echo "🔗 Linking configurations..."
mkdir -p "$CONFIG_DIR"

# Link Neovim and others
link_file "$CONFIG_DIR/nvim" "$CONFIG_DIR/nvim"
link_file "$CONFIG_DIR/sway" "$CONFIG_DIR/sway"
link_file "$CONFIG_DIR/foot" "$CONFIG_DIR/foot"
link_file "$CONFIG_DIR/fuzzel" "$CONFIG_DIR/fuzzel"
link_file "$CONFIG_DIR/mpv" "$CONFIG_DIR/mpv"
link_file "$CONFIG_DIR/mako" "$CONFIG_DIR/mako"
link_file "$CONFIG_DIR/yazi" "$CONFIG_DIR/yazi"

# Link tmux
if [ -f "$HOME/.tmux.conf" ]; then
    link_file "$HOME/.tmux.conf" "$HOME/.tmux.conf"
fi

echo "✅ Installation complete!"
echo "👉 Run 'nvim' to start. Mason will auto-install LSPs."
echo "👉 Run 'tmux' and press 'Ctrl-a I' to install tmux plugins."
