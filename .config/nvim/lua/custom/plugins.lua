local plugins = {
  {
    'vim-crystal/vim-crystal',
    ft = 'crystal',
    config = function (_)
      vim.g.crystal_auto_format = 1
    end
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
     "jose-elias-alvarez/null-ls.nvim",
     config = function()
       require "custom.configs.null-ls"
     end,
    },
    config = function (_)
      require 'plugins.configs.lspconfig'
      require 'custom.configs.lspconfig'
    end
  },
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        'autopep8',
        'angular-language-server',
        'css-lsp',
        'cssmodules-language-server',
        'eslint-lsp',
        'quick-lint-js',
        'typescript-langauge-server',
        'html-lsp',
        'python-lsp-server',
        'pyright',
        'rust-analyzer',
        'prettier',
        'stylua'
      }
    }
  },
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = {
        -- defaults 
        'vim',
        'lua',

        -- web dev 
        'html',
        'css',
        'javascript',
        'typescript',
        'tsx',
        'json',
        -- 'react',
        -- 'solid',
        -- "vue", "svelte",

       -- low level
        'c',
        'zig',

      -- back end
        'python'
      },
    },
  },
  {
    'tribela/vim-transparent'
  }

}

return plugins
