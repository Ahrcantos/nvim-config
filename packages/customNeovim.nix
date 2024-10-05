{ pkgs }:
let
  mkDerivation = pkgs.stdenv.mkDerivation;
  plugins = import ../config/plugins.nix { inherit pkgs; };


  wrappedNeovim = pkgs.wrapNeovim pkgs.neovim {
    configure = {
      packages.all.start = plugins;
      wrapRc = true;
    };
  };

  runtimeDependencies = [
    pkgs.nodePackages.typescript-language-server
    pkgs.nodePackages.vscode-langservers-extracted
    pkgs.nodePackages."@volar/vue-language-server"
    pkgs.ripgrep
    pkgs.nixpkgs-fmt
    pkgs.rust-analyzer
    pkgs.dhall-language-server
    pkgs.python310Packages.jedi-language-server
    pkgs.gopls
    # pkgs.csharp-ls
  ];

  bash = pkgs.bash;
  configDir = import ../config { inherit pkgs; };
  invokeNeovimScript = ''
    XDG_CONFIG_HOME="${configDir}" exec -a "$0" ${wrappedNeovim}/bin/nvim -u "${configDir}/nvim/init.lua" "$@"
  '';


in
pkgs.writeShellApplication {
  name = "nvim";
  runtimeInputs = runtimeDependencies;
  text = invokeNeovimScript;
}
