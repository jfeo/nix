{lib, ...}: {
  programs.nvf = {
    enable = true;
    enableManpages = true;
    settings.vim = {
      vimAlias = true;

      # -----------------------------------------
      # Basic editor options
      # -----------------------------------------

      globals = {
        mapleader = ",";
      };

      options = {
        expandtab = true;
        tabstop = 2;
        shiftwidth = 2;
      };

      # -----------------------------------------
      # User interface and interaction
      # -----------------------------------------

      theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
        transparent = true;
      };
      dashboard.dashboard-nvim.enable = true;
      telescope.enable = true;
      statusline.lualine.enable = true;
      ui = {
        noice = {
          enable = true;
          setupOpts.lsp.signature.enabled = true;
        };

        smartcolumn = {
          enable = true;
          setupOpts = {
            disabled_filetypes = [
              "help"
              "text"
              "markdown"
              "NvimTree"
              "alpha"
              "dashboard"
            ];
            custom_colorcolumn = {
              typst = "80";
              make = "80";
            };
          };
        };
      };

      mini.tabline.enable = true;
      projects.project-nvim.enable = true;
      visuals.rainbow-delimiters.enable = true;
      utility.ccc.enable = true;

      # -----------------------------------------
      # Version control
      # -----------------------------------------

      git.vim-fugitive.enable = true;

      # -----------------------------------------
      # File tree explorer
      # -----------------------------------------

      filetree.neo-tree = {
        enable = true;
        setupOpts = {
          window.position = "float";
          filesystem = {
            follow_current_file.enabled = true;
            use_libuv_file_watcher = true;
          };
        };
      };

      # -----------------------------------------
      # Language support
      # -----------------------------------------

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

      treesitter = {
        enable = true;
        fold = true;
      };

      lsp = {
        enable = true;
        formatOnSave = true;
        lspsaga.enable = true;
        inlayHints.enable = true;
        trouble.enable = true;
      };

      languages = {
        enableTreesitter = true;
        enableDAP = true;
        enableFormat = true;
        nix.enable = true;
        bash.enable = true;
        css.enable = true;
        go.enable = true;
        clang.enable = true;
        markdown.enable = true;
        typst = {
          enable = true;
          extensions.typst-preview-nvim.enable = true;
        };
        ruby.enable = true;
        r = {
          enable = true;
          format.type = ["styler"];
        };
      };

      # formatting
      formatter.conform-nvim = {
        enable = true;
        setupOpts = {
          formatters_by_ft = {
            typst = ["typstyle"];
          };
          formatters.typstyle.append_args = ["--wrap-text"];
        };
      };

      # debugging
      debugger = {
        nvim-dap.enable = true;
        nvim-dap.ui.enable = true;
      };

      # -----------------------------------------
      # Key bindings and keymaps
      # -----------------------------------------

      binds.whichKey = {
        enable = true;
        setupOpts.preset = "helix";
      };

      # keymaps
      keymaps = [
        {
          key = "<leader>cy";
          mode = ["v"];
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
          key = "<leader>cc";
          mode = ["n"];
          action = ":CccPick";
          silent = true;
          desc = "Pick color using ccc";
        }
        {
          key = "<leader>e";
          mode = ["n"];
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
        {
          key = "<Esc>";
          mode = "t";
          action = "<C-\\><C-n>";
          silent = true;
          desc = "Escape terminal mode";
        }
      ];

      # -----------------------------------------
      # Highligh active window
      # -----------------------------------------

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
  };
}
