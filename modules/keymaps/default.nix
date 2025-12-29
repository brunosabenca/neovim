{
  config.vim = {
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
      {
        key = "<leader>qq";
        mode = "n";
        silent = true;
        action = "<cmd>qa<cr>";
        desc = "Quit all";
      }
      # Buffers
      {
        key = "<S-h>";
        mode = "n";
        silent = true;
        action = "<cmd>bprev<cr>";
        desc = "Previous Buffer";
      }
      {
        key = "<S-l>";
        mode = "n";
        silent = true;
        action = "<cmd>bnext<cr>";
        desc = "Next Buffer";
      }
      {
        key = "<leader>bb";
        mode = "n";
        silent = true;
        action = "<cmd>e #<cr>";
        desc = "Switch to Other Buffer";
      }
      {
        key = "<leader>bd";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.bufdelete()<cr>";
        desc = "Delete Buffer";
      }
      {
        key = "<leader>bo";
        mode = "n";
        silent = true;
        action = "<cmd>lua Snacks.bufdelete.other()<cr>";
        desc = "Delete Other Buffers";
      }
      {
        key = "<leader>bD";
        mode = "n";
        silent = true;
        action = "<cmd>:bd<cr>";
        desc = "Delete Buffer and Window";
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
    ];
  };
}
