#!/bin/bash
# Linux / WSL 用 dotfiles セットアップスクリプト

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
LINUX_DIR="$DOTFILES_DIR/linux"

echo "dotfiles セットアップ開始 (Linux/WSL)"

# バックアップ関数
backup() {
  if [ -e "$1" ] && [ ! -L "$1" ]; then
    mv "$1" "$1.bak"
    echo "バックアップ: $1 -> $1.bak"
  fi
}

# nvim
backup "$HOME/.config/nvim"
ln -sfn "$LINUX_DIR/nvim" "$HOME/.config/nvim"
echo "リンク作成: ~/.config/nvim -> $LINUX_DIR/nvim"

# wezterm
backup "$HOME/.config/wezterm"
ln -sfn "$LINUX_DIR/wezterm" "$HOME/.config/wezterm"
echo "リンク作成: ~/.config/wezterm -> $LINUX_DIR/wezterm"

# bash
backup "$HOME/.bashrc"
ln -sfn "$LINUX_DIR/bash/.bashrc" "$HOME/.bashrc"
echo "リンク作成: ~/.bashrc -> $LINUX_DIR/bash/.bashrc"

# starship
mkdir -p "$HOME/.config"
backup "$HOME/.config/starship.toml"
ln -sf "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"
echo "リンク作成: ~/.config/starship.toml -> $DOTFILES_DIR/starship.toml"

echo "セットアップ完了"
