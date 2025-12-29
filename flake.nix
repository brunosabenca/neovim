{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {nixpkgs, ...} @ inputs: {
    imports = [
      ./keymaps.nix
    ];
    packages.x86_64-linux = {
      default =
        (inputs.nvf.lib.neovimConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [
            {
              config.vim = {
                options = {
                  autoindent = true;
                  smartindent = true;
                  shiftwidth = 2;
                  foldlevel = 99;
                  foldcolumn = "auto:1";
                  mousescroll = "ver:1,hor:1";
                  mousemoveevent = true;
                  fillchars = "eob:‿,fold: ,foldopen:▼,foldsep:⸽,foldclose:⏵";
                  signcolumn = "yes";
                  tabstop = 2;
                  softtabstop = 2;
                  wrap = false;
                };

                clipboard = {
                  enable = true;
                  registers = "unnamedplus";
                  providers.wl-copy.enable = true;
                };

                theme.enable = true;
                theme.name = "catppuccin";
                theme.style = "mocha";

                undoFile.enable = true;

                terminal.toggleterm = {
                  enable = true;
                  lazygit = {
                    enable = true;
                    mappings.open = "<leader>gl";
                  };
                };

                utility = {
                  motion.flash-nvim.enable = true;
                  outline.aerial-nvim.enable = true;
                };

                statusline.lualine.enable = true;

                treesitter.enable = true;

                telescope.enable = true;

                autocomplete.nvim-cmp.enable = true;

                languages = {
                  enableFormat = true;
                  enableTreesitter = true;
                  nix.enable = true;
                };

                formatter = {
                  conform-nvim = {
                    enable = true;
                  };
                };

                lsp = {
                  enable = true;
                  trouble.enable = true;
                  formatOnSave = true;
                };

                utility = {
                  oil-nvim.enable = true;
                  snacks-nvim = {
                    enable = true;
                    setupOpts = {
                      quickfile.enabled = true;
                      picker.enabled = true;
                      explorer.enabled = true;
                      bufdelete.enabled = true;
                      gitsigns.enabled = true;
                    };
                  };
                };

                globals.mapleader = " ";
                binds = {
                  whichKey = {
                    enable = true;
                    # TODO: registers
                    register = {};
                  };
                };

                keymaps = [
                  # General Mappings
                  {
                    key = "s";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua require('flash').jump()<cr>";
                    desc = "Flash";
                  }
                  {
                    key = "K";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua vim.lsp.buf.hover()<cr>";
                    desc = "LSP Hover";
                  }
                  {
                    key = "<C-tab>";
                    mode = "n";
                    silent = true;
                    action = "<cmd>bnext<cr>";
                    desc = "Next Buffer";
                  }
                  {
                    key = "<C-s>";
                    mode = "n";
                    silent = true;
                    action = "<cmd>w<cr>";
                    desc = "Save file";
                  }

                  # UI
                  {
                    key = "<leader>uw";
                    mode = "n";
                    silent = true;
                    action = "<cmd>set wrap!<cr>";
                    desc = "Toggle word wrapping";
                  }
                  {
                    key = "<leader>ul";
                    mode = "n";
                    silent = true;
                    action = "<cmd>set linebreak!<cr>";
                    desc = "Toggle linebreak";
                  }
                  {
                    key = "<leader>us";
                    mode = "n";
                    silent = true;
                    action = "<cmd>set spell!<cr>";
                    desc = "Toggle spellLazyGitcheck";
                  }
                  {
                    key = "<leader>uc";
                    mode = "n";
                    silent = true;
                    action = "<cmd>set cursorline!<cr>";
                    desc = "Toggle cursorline";
                  }
                  {
                    key = "<leader>un";
                    mode = "n";
                    silent = true;
                    action = "<cmd>set number!<cr>";
                    desc = "Toggle line numbers";
                  }
                  {
                    key = "<leader>ur";
                    mode = "n";
                    silent = true;
                    action = "<cmd>set relativenumber!<cr>";
                    desc = "Toggle relative line numbers";
                  }
                  {
                    key = "<leader>ut";
                    mode = "n";
                    silent = true;
                    action = "<cmd>set showtabline=2<cr>";
                    desc = "Show tabline";
                  }
                  {
                    key = "<leader>uT";
                    mode = "n";
                    silent = true;
                    action = "<cmd>set showtabline=0<cr>";
                    desc = "Hide tabline";
                  }

                  # Windows
                  {
                    key = "<leader>ws";
                    mode = "n";
                    silent = true;
                    action = "<cmd>split<cr>";
                    desc = "Split";
                  }
                  {
                    key = "<leader>wv";
                    mode = "n";
                    silent = true;
                    action = "<cmd>vsplit<cr>";
                    desc = "VSplit";
                  }
                  {
                    key = "<leader>wd";
                    mode = "n";
                    silent = true;
                    action = "<cmd>close<cr>";
                    desc = "Close";
                  }

                  # Top Pickers & Explorer
                  {
                    key = "<leader> ";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.smart()<cr>";
                    desc = "Smart Find Files";
                  }
                  {
                    key = "<leader>,";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.buffers()<cr>";
                    desc = "Buffers";
                  }
                  {
                    key = "<leader>/";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.grep()<cr>";
                    desc = "Grep";
                  }
                  {
                    key = "<leader>:";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.command_history()<cr>";
                    desc = "Command History";
                  }
                  {
                    key = "<leader>e";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.explorer()<cr>";
                    desc = "File Explorer";
                  }
                  {
                    key = "-";
                    mode = "n";
                    silent = true;
                    action = "<cmd>Oil<cr>";
                    desc = "Oil";
                  }

                  # Find
                  {
                    key = "<leader>fb";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.buffers()<cr>";
                    desc = "Buffers";
                  }
                  {
                    key = "<leader>fc";
                    mode = "n";
                    silent = true;
                    action = ''<cmd>lua Snacks.picker.files({ cwd = vim.fn.stdpath("config") })<cr>'';
                    desc = "Find Config File";
                  }
                  {
                    key = "<leader>ff";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.files()<cr>";
                    desc = "Find Files";
                  }
                  {
                    key = "<leader>fg";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.git_files()<cr>";
                    desc = "Find Git Files";
                  }
                  {
                    key = "<leader>fp";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.projects()<cr>";
                    desc = "Projects";
                  }
                  {
                    key = "<leader>fr";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.recent()<cr>";
                    desc = "Recent";
                  }
                  {
                    key = "<leader>fn";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.notifications()<cr>";
                    desc = "Notification History";
                  }
                  {
                    key = "<leader>fe";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.icons()<cr>";
                    desc = "Emoji";
                  }

                  # Git
                  {
                    key = "<leader>gb";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.git_branches()<cr>";
                    desc = "Git Branches";
                  }
                  {
                    key = "<leader>gL";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.git_log()<cr>";
                    desc = "Git Log Line";
                  }
                  {
                    key = "<leader>gs";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.git_status()<cr>";
                    desc = "Git Status";
                  }
                  {
                    key = "<leader>gS";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.git_stash()<cr>";
                    desc = "Git Stash";
                  }
                  {
                    key = "<leader>gd";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.git_diff()<cr>";
                    desc = "Git Diff (Hunks)";
                  }
                  {
                    key = "<leader>gf";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.git_log_file()<cr>";
                    desc = "Git Log File";
                  }

                  # Grep
                  {
                    key = "<leader>sb";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.lines()<cr>";
                    desc = "Buffer Lines";
                  }
                  {
                    key = "<leader>st";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.todo_comments()<cr>";
                    desc = "Todos";
                  }
                  {
                    key = "<leader>sB";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.grep_buffers()<cr>";
                    desc = "Grep Open Buffers";
                  }
                  {
                    key = "<leader>sg";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.grep()<cr>";
                    desc = "Grep";
                  }
                  {
                    key = "<leader>sw";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.grep_word()<cr>";
                    desc = "Visual selection or word";
                  }
                  {
                    key = "<leader>sr";
                    mode = "n";
                    silent = true;
                    action = "<cmd>nohlsearch<cr>";
                    desc = "Reset search";
                  }

                  # LSP
                  {
                    key = "gd";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.lsp_definitions()<cr>";
                    desc = "Goto Definition";
                  }
                  {
                    key = "gD";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.lsp_declarations()<cr>";
                    desc = "Goto Declaration";
                  }
                  {
                    key = "gr";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.lsp_references()<cr>";
                    desc = "References";
                    nowait = true;
                  }
                  {
                    key = "gI";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.lsp_implementations()<cr>";
                    desc = "Goto Implementation";
                  }
                  {
                    key = "gy";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.lsp_type_definitions()<cr>";
                    desc = "Goto Type Definition";
                  }
                  {
                    key = "<leader>ss";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.lsp_symbols()<cr>";
                    desc = "LSP Symbols";
                  }
                  {
                    key = "<leader>sS";
                    mode = "n";
                    silent = true;
                    action = "<cmd>lua Snacks.picker.lsp_workspace_symbols()<cr>";
                    desc = "LSP Workspace Symbols";
                  }
                ];
              };
            }
          ];
        }).neovim;
    };
  };
}
