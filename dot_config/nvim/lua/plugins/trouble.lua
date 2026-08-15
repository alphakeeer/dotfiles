return {
  {
    "folke/trouble.nvim",

    cmd = "Trouble",

    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    opts = {
      auto_close = false,
      auto_open = false,
      auto_preview = true,
      auto_refresh = true,

      focus = true,
      follow = true,

      warn_no_results = false,
    },

    keys = {
      -- ========================================================
      -- Diagnostics
      -- ========================================================

      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Workspace Diagnostics",
      },

      {
        "<leader>xb",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics",
      },

      -- ========================================================
      -- Symbols / Outline
      -- ========================================================

      {
        "<leader>xs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Document Symbols",
      },

      -- ========================================================
      -- LSP
      -- ========================================================

      {
        "<leader>xl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Results",
      },

      -- ========================================================
      -- Lists
      -- ========================================================

      {
        "<leader>xq",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List",
      },

      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List",
      },
    },
  },
}
