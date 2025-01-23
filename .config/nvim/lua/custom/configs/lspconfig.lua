local on_attach    = require('plugins.configs.lspconfig').on_attach
local capabilities = require('plugins.configs.lspconfig').capabilities
local lspconfig    = require 'lspconfig'
local servers = {'pylsp', 'lua_ls', 'angularls', 'pyright',
                 'cssls', 'cssmodules_ls', 'tsserver', 'html'}
capabilities.textDocument.completion.completionItem.snippetSupport = true


for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end


lspconfig.rust_analyzer.setup({
  on_attach    = on_attach,
  capabilities = capabilities,
  filetypes    = {'rust'},
  root_dir     = lspconfig.util.root_pattern('Cargo.toml')
})



lspconfig.pylsp.setup({
  on_attach    = on_attach,
  capabilities = capabilities,
  filetypes    = {'python'},
  root_dir     = lspconfig.util.root_pattern('pyproject.toml'),
  settings     = {
    python     = {
      analysis = {
                    autoSearchPaths        = true,
                    diagnosticMode         = 'workspace',
                    useLibraryCodeForTypes = true
      }
    }
  }

})
