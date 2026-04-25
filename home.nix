{ config, pkgs, ... }: {
  home.username = "winter";
  home.homeDirectory = "/home/winter";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    starship
    neovim
  ];

  xdg.configFile."nvim" = {
    source = ./linux/nvim;
    recursive = true;
  };

  xdg.configFile."wezterm" = {
    source = ./linux/wezterm;
    recursive = true;
  };

  xdg.configFile."starship.toml".source = ./starship.toml;

  home.file.".bashrc".source = ./linux/bash/.bashrc;

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    initExtra = builtins.readFile ./linux/zsh/.zshrc;
  };
}
