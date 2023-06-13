{ pkgs }:
let
  mkDerivation = pkgs.stdenv.mkDerivation;
  configDir = mkDerivation {
    name = "nvim-config-dir";
    src = ./config-dir;
    installPhase = ''
      mkdir -p $out/nvim
      ls -la
      cp -r ./* $out/nvim
    '';
  };
in configDir
