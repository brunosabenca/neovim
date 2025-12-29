{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs =
    { nixpkgs, ... }@inputs:
    {
      packages.x86_64-linux = {
        default =
          (inputs.nvf.lib.neovimConfiguration {
            pkgs = nixpkgs.legacyPackages.x86_64-linux;
            modules = [
              {
                config.vim = {
                  theme.enable = true;
                  theme.name = "gruvbox";
                  theme.style = "dark";

                  treesitter.enable = true;
                };
              }
            ];
          }).neovim;
      };
    };
}
