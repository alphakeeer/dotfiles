return {
  -- ============================================================
  -- Mason
  -- ============================================================

  {
    "mason-org/mason.nvim",
    lazy = false,

    opts = {
      ui = {
        border = "rounded",

        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- ============================================================
  -- LSP configuration definitions
  -- ============================================================

  {
    "neovim/nvim-lspconfig",
    lazy = false,
  },

  -- ============================================================
  -- Mason <-> Neovim LSP bridge
  -- ============================================================

  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,

    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },

    opts = {
      ensure_installed = {
        -- Neovim / Lua
        "lua_ls",

        -- Python
        "pyright",

        -- C / C++
        "clangd",

        -- Shell
        "bashls",

        -- Config files
        "jsonls",
        "yamlls",
      },

      -- Uses vim.lsp.enable() internally.
      automatic_enable = true,
    },

    config = function(_, opts)
      require("mason-lspconfig").setup(opts)

      -- ========================================================
      -- Diagnostics
      -- ========================================================

      vim.diagnostic.config({
        severity_sort = true,
        update_in_insert = false,

        underline = true,
        signs = true,

        virtual_text = {
          spacing = 2,
          source = true,
          prefix = "●",
        },

        float = {
          border = "rounded",
          source = true,
        },
      })

      -- ========================================================
      -- LSP keymaps
      -- ========================================================

      local group = vim.api.nvim_create_augroup(
        "UserLspConfig",
        { clear = true }
      )

      vim.api.nvim_create_autocmd("LspAttach", {
        group = group,

        callback = function(event)
          local bufnr = event.buf

          local function map(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, {
              buffer = bufnr,
              silent = true,
              desc = desc,
            })
          end

          -- Navigation
          map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
          map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")

          -- LSP actions
          map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, "Code Action")
          map("n", "<leader>lr", vim.lsp.buf.rename, "Rename Symbol")

          -- Diagnostics
          map(
            "n",
            "<leader>ld",
            vim.diagnostic.open_float,
            "Line Diagnostics"
          )

          map(
            "n",
            "<leader>lq",
            vim.diagnostic.setloclist,
            "Diagnostics List"
          )
        end,
      })
    end,
  },

  -- ============================================================
  -- Better Lua development inside Neovim
  -- ============================================================

  {
    "folke/lazydev.nvim",
    ft = "lua",

    opts = {
      library = {
        {
          path = "${3rd}/luv/library",
          words = { "vim%.uv" },
        },
      },
    },
  },
}
