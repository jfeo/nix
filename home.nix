{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  home = {
    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "25.05"; # Please read the comment before changing.

    username = "feo";
    homeDirectory = "/home/feo";

    packages = [
      pkgs.wget
      pkgs.curl
    ];

    file = { };

    sessionVariables = {
      EDITOR = "vim";
    };
  };

  programs.firefox.enable = true;

  programs.alacritty = {
    enable = true;
    settings = {
      font.size = 12;
      font.normal.family = "Berkeley Mono Nerd Font";
    };
  };

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
