local trouble = require('trouble');

trouble.setup {
  icons = false,
  fold_open = "v", -- icon used for open folds
  fold_closed = ">", -- icon used for closed folds
  indent_lines = false, -- add an indent guide below the fold icons
  signs = {
    error = "error",
    warning = "warn",
    hint = "hint",
    information = "info",
  },
  use_diagnostic_signs = false,
}
