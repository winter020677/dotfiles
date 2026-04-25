{ config, pkgs, ... }:

{
  home.username = "winter";
  home.homeDirectory = "/home/winter";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    git
    neovim
    fzf
    ripgrep
    fd
    bat
    eza
    lazygit
    nb
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  home.sessionPath = [ "${config.home.homeDirectory}/.local/bin" ];

  programs.zsh = {
    enable = true;

    history = {
      path = "${config.home.homeDirectory}/.zsh_history";
      size = 10000;
      save = 10000;
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
    };

    shellAliases = {
      ls     = "ls --color=auto";
      ll     = "ls -alF";
      la     = "ls -A";
      l      = "ls -CF";
      grep   = "grep --color=auto";
      nbsync = "nb all-thinking:sync";
    };

    initContent = ''
      export NVM_DIR="$HOME/.nvm"
      [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
      [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

      autoload -Uz add-zsh-hook
      __wezterm_osc7() { printf '\033]7;file://%s\033\\' "$PWD" }
      add-zsh-hook precmd __wezterm_osc7

      eval "$(starship init zsh)"

      __set_input_color_pink() { PROMPT="''${PROMPT}"$'%{\e[38;2;255;200;232m%}' }
      add-zsh-hook precmd __set_input_color_pink
    '';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = false;

    settings = {
      add_newline  = false;
      scan_timeout = 1000;
      format = "[╭─](fg:#ffb3e0)$directory$git_branch$git_status$python$cmd_duration\n[╰─❯](fg:#ffb3e0) ";

      directory = {
        style             = "bold fg:#ffd6ee";
        format            = "[ 󰉋 $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = "doc";
          "Downloads" = "dl";
          "Music"     = "music";
          "Pictures"  = "pic";
        };
      };

      git_branch = {
        format = "[ 󰊢 $branch](fg:#ffc8e8)";
      };

      git_status = {
        format     = "([$all_status$ahead_behind ](fg:#ff5c8a))";
        conflicted = "!";
        untracked  = "?";
        modified   = "~";
        staged     = "+";
        deleted    = "-";
        ahead      = "⇡$count";
        behind     = "⇣$count";
      };

      python = {
        format         = "[ 󰌠 $version](fg:#d8b4f0)";
        version_format = "\${raw}";
      };

      cmd_duration = {
        format   = "[ 󱑃 $duration](fg:#e0a0d8)";
        min_time = 2000;
      };
    };
  };

  # lazy.nvim が lazy-lock.json を書き換えられるよう out-of-store symlink
  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/nvim";

  programs.home-manager.enable = true;
}
