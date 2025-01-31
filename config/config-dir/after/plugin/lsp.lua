local lspconfig = require('lspconfig')
local null_ls = require("null-ls")

local on_attach = function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}


  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('v', '<leader>a', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)

end

local lsp_flags = {
  debouce_text_changes = 150
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()


-- Rust
lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true;
      }
    }
  }
}

-- Typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
}

-- Eslint
lspconfig.eslint.setup {
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
    "svelte",
    "astro",
    "html"
  }
}

-- Vue
lspconfig.volar.setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}

-- Cobol
vim.g.cobol_colorcolumns = 1

-- Nix
lspconfig.rnix.setup{}

-- Dhall
lspconfig.dhall_lsp_server.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- Golang

lspconfig.gopls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    }
  },
}

-- Python
lspconfig.jedi_language_server.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort
    },
})

-- Spelling / Grammar
lspconfig.ltex.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ltex = {
      language = "en-US",
      enabledRules = {
        ["*"] = {
          "MISSING_VERB",
          "PASSIVE_VOICE"
        }
      },
      completionEnabled = true,
      additionalRules = {
        enablePickyRules = true
      }
    }
  }
}


vim.diagnostic.config({
  virtual_text = false,
  signs = true,
})
vim.wo.signcolumn = "yes"

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]


-- Snippet
local luasnip = require 'luasnip'

-- Completion
local cmp = require('cmp')

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}
