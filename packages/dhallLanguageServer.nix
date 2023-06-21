{ pkgs }:
let
  version = "1.32.0";
  system = "x86_64-linux";
in
pkgs.stdenv.mkDerivation
{
  name = "dhall-lsp-server-${version}";
  src = pkgs.fetchurl {
    url = "https://github.com/dhall-lang/dhall-haskell/releases/download/${version}/dhall-lsp-server-1.0.7-${system}.tar.bz2";
    sha256 = "sha256-1OO7uTkk9fWBeMMXJaavhgdmMexnYg4quUKCnXH2Zr0=";
  };
  sourceRoot = ".";
  installPhase = ''
   tar -xf $src
   mkdir -p $out/bin
   cp ./bin/dhall-lsp-server $out/bin/dhall-lsp-server
  '';
}
