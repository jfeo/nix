{ lib, pkgs, ... }:
{
  programs.nvf.enable = true;
  programs.nvf.enableManpages = true;
  programs.nvf.settings.vim = {
    vimAlias = true;

    globals = {
      mapleader = ",";
    };

    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
      transparent = true;
    };

    # editor options
    options = {
      expandtab = true;
      tabstop = 2;
      shiftwidth = 2;
    };

    # ui and interaction
    dashboard.dashboard-nvim.enable = true;
    telescope.enable = true;
    statusline.lualine.enable = true;
    ui.noice = {
      enable = true;
      setupOpts.lsp.signature.enabled = true;
    };
    ui.smartcolumn = {
      enable = true;
      setupOpts.disabled_filetypes = [
        "help"
        "text"
        "markdown"
        "NvimTree"
        "alpha"
        "dashboard"
      ];
      setupOpts.custom_colorcolumn = {
        typst = "80";
        make = "80";
      };
    };
    binds.whichKey = {
      enable = true;
      setupOpts.preset = "helix";
    };
    mini.tabline.enable = true;
    projects.project-nvim.enable = true;
    filetree.neo-tree.enable = true;
    visuals.rainbow-delimiters.enable = true;

    # version control
    git.vim-fugitive.enable = true;

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
      go.enable = true;
      clang.enable = true;
      markdown.enable = true;
      markdown.format.enable = true;
      typst = {
        enable = true;
        lsp.enable = true;
        treesitter.enable = true;
        format.enable = true;
        extensions.typst-preview-nvim.enable = true;
      };
      ruby = {
        enable = true;
        lsp = {
          enable = true;
          package = pkgs.rubyPackages.solargraph;
        };
        format.enable = true;
      };
    };

    formatter.conform-nvim = {
      enable = true;
      setupOpts.formatters_by_ft = {
        typst = [ "typstyle" ];
      };
      setupOpts.formatters.typstyle.append_args = [ "--wrap-text" ];
    };

    # debugging
    debugger.nvim-dap.enable = true;
    debugger.nvim-dap.ui.enable = true;
    languages.clang.dap.enable = true;

    # keymaps
    keymaps = [
      {
        key = "<leader>cy";
        mode = [ "v" ];
        action = "\"+y";
        silent = true;
        desc = "Yank to system clipboard";
      }
      {
        key = "<leader>cp";
        mode = [
          "n"
          "v"
        ];
        action = "\"+p";
        silent = true;
        desc = "Paste from system clipboard";
      }
      {
        key = "<leader>e";
        mode = [ "n" ];
        action = ":Neotree toggle<CR>";
        silent = true;
        desc = "Toggle Neotree file manager";
      }
      {
        key = "<leader>ts";
        mode = "n";
        action = ":split<CR>:terminal<CR>";
        silent = true;
        desc = "Create terminal horizontally";
      }
      {
        key = "<leader>tv";
        mode = "n";
        action = ":vsplit<CR>:terminal<CR>";
        silent = true;
        desc = "Create terminal vertically";
      }
    ];

    maps.terminal = {
      "<Esc>" = {
        action = "<C-\\><C-n>";
        silent = true;
        desc = "Escape terminal mode";
      };
    };

    # highligh active window
    highlight = {
      ActiveWindow = {
        bg = "#212133"; # matches catppuccin mocha 'base' color
      };
    };

    autocmds = [
      {
        event = [
          "WinEnter"
          "WinLeave"
          "BufEnter"
        ];
        callback = lib.generators.mkLuaInline ''
          function()
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              local is_current = (win == vim.api.nvim_get_current_win())
              vim.api.nvim_set_option_value(
                "winhighlight",
                is_current and "Normal:ActiveWindow" or "Normal:Normal",
                { win = win }
              )
            end
          end
        '';
      }
    ];
  };
}
