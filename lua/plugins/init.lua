return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre' -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    'nvimdev/lspsaga.nvim',
    event = "LspAttach",
    ft = {"typescript"},
    config = function()
      require('lspsaga').setup({
        border_style = 'rounded'
      })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- optional
      'nvim-tree/nvim-web-devicons'     -- optional
    }
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", "stylua",
        "html-lsp", "css-lsp" , "prettier", "typescript-language-server",
        "eslint-lsp", "tailwindcss-language-server"
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "tailwindcss"
      }
    },
  },
  {
    "vim-crystal/vim-crystal",
    ft="crystal"
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "configs.lint"
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "javascript",
        "typescript",
        "tsx"
      },
    },
  },
}
