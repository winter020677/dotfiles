{ config, ... }:

{
  # WezTerm は Linux ネイティブアプリとして ~/.config/wezterm を参照する
  xdg.configFile."wezterm".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/wezterm";
}
