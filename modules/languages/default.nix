{
  config.vim = {
    diagnostics = {
      enable = true;
      config = {
        signs = {
          text = {
            "vim.diagnostic.severity.Error" = " ";
            "vim.diagnostic.severity.Warn" = " ";
            "vim.diagnostic.severity.Hint" = " ";
            "vim.diagnostic.severity.Info" = " ";
          };
        };
        underline = true;
        update_in_insert = true;
      };
      nvim-lint = {
        enable = true;
      };
    };
    syntaxHighlighting = true;
    treesitter = {
      enable = true;
      autotagHtml = true;
      context.enable = true;
      highlight.enable = true;
    };
    lsp = {
      enable = true;
      trouble.enable = true;
      lspSignature.enable = true;
      formatOnSave = true;
    };
    languages = {
      enableDAP = true;
      enableExtraDiagnostics = true;
      enableFormat = true;
      enableTreesitter = true;

      markdown = {
        enable = true;
        format.type = ["prettierd"];
        extensions = {
          markview-nvim = {
            enable = true;
          };
        };
      };
      css.enable = true;
      html.enable = true;
      nix.enable = true;
      bash.enable = true;
    };
    formatter = {
      conform-nvim = {
        enable = true;
      };
    };
  };
}
