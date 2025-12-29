{
  config.vim = {
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;
    undoFile.enable = true;
    utility = {
      motion.flash-nvim.enable = true;
      outline.aerial-nvim.enable = true;
    };
    tabline.nvimBufferline.enable = true;
    statusline.lualine.enable = true;
    ui = {
      noice.enable = true;
      colorizer.enable = true;
    };
    git = {
      enable = true;
      gitsigns.enable = true;
    };
    terminal.toggleterm = {
      enable = true;
      lazygit = {
        enable = true;
        mappings.open = "<leader>gg";
      };
    };
    visuals = {
      rainbow-delimiters.enable = true;
      nvim-scrollbar = {
        enable = false;
      };
    };
  };
}
