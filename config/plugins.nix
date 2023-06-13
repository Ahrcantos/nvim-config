# https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages
{ pkgs }:
with pkgs.vimPlugins; [
  telescope-nvim
  onedark-nvim
  nvim-treesitter.withAllGrammars
  targets-vim
  nvim-lspconfig
  nvim-cmp
  cmp-nvim-lsp
  cmp_luasnip
  luasnip
  vim-commentary
  rust-tools-nvim
  git-blame-nvim
  trouble-nvim
]
