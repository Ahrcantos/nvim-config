return function()
  local filetype = vim.bo.filetype
  if filetype == 'typescript' or filetype == 'javascript' or filetype == 'vue' then
    vim.cmd.EslintFixAll()
  else
    vim.lsp.buf.format()
  end
end
