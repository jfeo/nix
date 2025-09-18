{ ... }:
{
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
        css.enable = true;
      };
    };
  };

}
