{ lib, ... }:

{
  # nb notebooks → Windows の Obsidian Vault と共有
  home.activation.nbSymlinks = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ln -sfn /mnt/c/Users/rinta/Documents/all-thinking $HOME/.nb/all-thinking
    ln -sfn /mnt/c/Users/rinta/Documents/all-thinking/music_is_my_lielife $HOME/.nb/music
  '';

  # WezTerm は Windows ネイティブアプリ → Windows の設定ディレクトリにコピー
  home.activation.weztermWindows = lib.hm.dag.entryAfter ["writeBoundary"] ''
    mkdir -p /mnt/c/Users/rinta/.config/wezterm
    cp $HOME/.dotfiles/wezterm/wezterm.lua /mnt/c/Users/rinta/.config/wezterm/wezterm.lua
    cp $HOME/.dotfiles/wezterm/keybinds.lua /mnt/c/Users/rinta/.config/wezterm/keybinds.lua
  '';
}
