vim.g.mapleader = ","


-- Tabs
vim.keymap.set('n', '<leader>tn', vim.cmd.tabnew)
vim.keymap.set('n', '<leader>th', vim.cmd.tabfirst)
vim.keymap.set('n', '<leader>tl', vim.cmd.tablast)
vim.keymap.set('n', '<leader>tj', vim.cmd.tabprevious)
vim.keymap.set('n', '<leader>tk', vim.cmd.tabnext)


-- Linting
vim.keymap.set('n', '<leader>e', vim.cmd.EslintFixAll)
