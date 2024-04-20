local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>v', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>v', builtin.git_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>s', builtin.live_grep)

vim.keymap.set('n', '<leader>ld', builtin.diagnostics, {})
