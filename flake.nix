{
  description = "Neovim configuration";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs";
    };
    neovim = {
      url = "github:neovim/neovim/stable?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, neovim }:
    let
      overlayFlakeInputs = prev: final: {
        neovim = neovim.packages.x86_64-linux.neovim;
      };
      overlayCustomNeovim = prev: final: {
        customNeovim = import ./packages/customNeovim.nix {
          pkgs = final;
        };
      };

      overlayDhallLanguageServer = prev: final: {
        dhall-language-server = import ./packages/dhallLanguageServer.nix {
          pkgs = final;
        };
      };

      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [ overlayFlakeInputs overlayDhallLanguageServer overlayCustomNeovim ];
      };
    in
    {
      packages.x86_64-linux.default = pkgs.customNeovim;
      apps.x86_64-linux.default = {
        type = "app";
        program = "${pkgs.customNeovim}/bin/nvim";
      };
    };
}
