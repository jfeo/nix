{
  config,
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  home = {
    stateVersion = "25.05"; # Do not change without ensuring compatibility

    username = "feo";
    homeDirectory = "/home/feo";

    packages = with pkgs; [
      wget
      curl
      swww
      hyprpolkitagent
      dunst
      wl-clipboard
    ];

    # file."${config.xdg.configHome}" = {
    #   source = ./dotfiles;
    #   recursive = true;
    # };

    sessionVariables = {
      EDITOR = "vim";
    };
  };

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    input.kb_layout = "dk";
    bind = [
      "$mod, Return, exec, alacritty"
      "$mod, Q, killactive,"
      "$mod, R, exec, rofi -show drun"
      "$mod, F, exec, firefox"
      ", Print, exec, grimblast copy area"
    ]
    ++ (
      # workspaces
      # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
      builtins.concatLists (
        builtins.genList (
          i:
          let
            ws = i + 1;
          in
          [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
        ) 9
      )
    );
  };

  programs.firefox.enable = true;

  programs.alacritty = {
    enable = true;
    settings = {
      font.size = 12;
      font.normal.family = "Berkeley Mono Nerd Font";
    };
  };

  programs.kitty.enable = true; # for default hyprland setup
  programs.rofi.enable = true;
  programs.wofi.enable = true;
  programs.waybar.enable = true;

  programs.git = {
    enable = true;
    userEmail = "jens@feodor.dk";
    userName = "Jens Feodor Nielsen";
  };

  programs.nvf = {
    enable = true;

    settings.vim = {
      vimAlias = true;

      # editor options
      options = {
        expandtab = true;
        tabstop = 2;
        shiftwidth = 2;
      };

      # ui and interaction
      theme = {
        enable = true;
        name = "gruvbox";
        style = "dark";
      };
      dashboard.dashboard-nvim.enable = true;
      telescope.enable = true;
      statusline.lualine.enable = true;
      ui.noice.enable = true;
      binds.whichKey = {
        enable = true;
        setupOpts.preset = "helix";
      };
      mini.tabline.enable = true;
      projects.project-nvim.enable = true;
      filetree.neo-tree.enable = true;

      # language support
      diagnostics = {
        enable = true;
        config = {
          underline = true;
          update_in_insert = true;
          virtual_lines = true;
          virtual_text = true;
        };
      };
      autocomplete.blink-cmp.enable = true;
      treesitter.enable = true;
      lsp = {
        enable = true;
        formatOnSave = true;
        lspsaga.enable = true;
        inlayHints.enable = true;
        trouble.enable = true;
      };

      languages = {
        enableTreesitter = true;
        nix.enable = true;
        bash.enable = true;
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
