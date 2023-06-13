local treesitterConfig = require('nvim-treesitter.configs')

treesitterConfig.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ignore_install = { "c", "lua", "vim", "help", "javascript", "typescript", "rust", "vue"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  highlight = {
    enable = true,
  },
}
