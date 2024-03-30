return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
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
        "eslint-lsp", "tailwindcss-language-server", "prisma-language-server",
      },
    },
  },
  { 'echasnovski/mini.surround', version = false,
    config = function ()
      require('mini.surround').setup({
        mappings = {
          add = 'ys',       -- Add surrounding
          delete = 'ds',    -- Delete surrounding
          find = 'sf',      -- Find surrounding (to cursor)
          find_left = 'sF', -- Find surrounding (to cursor, but to the left)
          highlight = 'sh', -- Highlight surrounding
          replace = 'cs',   -- Replace surrounding
          update_n_lines = 'sn', -- Update `n_lines`
        },
        -- More customization options available...
      })
    end,
    event = "BufRead"
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "tailwindcss",
        "prismals",
      }
    },
    config = function()
      require("mason-lspconfig").setup {
        -- Add your configuration here
      }
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
    opts = {
      servers = {
        tailwind = {}
      }
    }
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function ()
      require('colorizer').setup({
        user_default_options = {
          tailwind = true,
        },
      })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      -- original LazyVim kind icon formatter
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
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
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- 'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- "rcarriga/nvim-notify",
    },
    config = function ()
      require("noice").setup({
        lsp = {
          hover = {
            enabled = false, -- This disables Noice's handling of the hover functionality
          },
          signature = {
            enabled = false, -- This disables Noice's handling of the signature help functionality
          },
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = false, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      })
    end
  }
}
