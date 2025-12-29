{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    forEachSystem = nixpkgs.lib.genAttrs ["x86_64-linux"];
  in {
    packages = forEachSystem (system: let
      pkgs = inputs.nixpkgs.legacyPackages.${system};

      configModule = {
        # You may browse available options for nvf on the online manual. Please see
        # <https://notashelf.github.io/nvf/options.html>
        config.vim = {
          theme.enable = true;

          languages = {
            enableLSP = true;
            enableFormat = true;
            enableTreesitter = true;
            enableExtraDiagnostics = true;

            # Nix language and diagnostics.
            nix.enable = true;
          };
        };
      };

      # Evaluate any and all modules to create the wrapped Neovim package.
      neovimConfigured = inputs.nvf.lib.neovimConfiguration {
        inherit pkgs;

        modules = [
          configModule
          ./modules/general
        ];
      };
    in {
      # Packages to be exposed under packages.<system>. Those can accessed
      # directly from package outputs in other flakes if this flake is added
      # as an input. You may run those packages with 'nix run .#<package>'
      default = self.packages.${system}.neovim;
      neovimConfigured = neovimConfigured.neovim;
    });
  };
}
