return {
  {
    "stevearc/conform.nvim",

    event = {
      "BufWritePre",
    },

    cmd = {
      "ConformInfo",
    },

    keys = {
      {
        "<leader>lf",
        function()
          require("conform").format({
            async = true,
            lsp_format = "fallback",
          })
        end,
        mode = { "n", "v" },
        desc = "Format",
      },
    },

    opts = {
      formatters_by_ft = {
        -- Lua
        lua = {
          "stylua",
        },

        -- Python
        python = {
          "ruff_format",
        },

        -- C / C++
        c = {
          "clang_format",
        },

        cpp = {
          "clang_format",
        },

        -- Shell
        sh = {
          "shfmt",
        },

        bash = {
          "shfmt",
        },

        -- Web
        javascript = {
          "prettier",
        },

        javascriptreact = {
          "prettier",
        },

        typescript = {
          "prettier",
        },

        typescriptreact = {
          "prettier",
        },

        html = {
          "prettier",
        },

        css = {
          "prettier",
        },

        -- Structured data
        json = {
          "prettier",
        },

        jsonc = {
          "prettier",
        },

        yaml = {
          "prettier",
        },

        -- Documents
        markdown = {
          "prettier",
        },
      },

      default_format_opts = {
        lsp_format = "fallback",
      },

      format_on_save = {
        timeout_ms = 1000,
        lsp_format = "fallback",
      },

      formatters = {
        shfmt = {
          append_args = {
            "-i",
            "2",
          },
        },
      },

      notify_on_error = true,
    },
  },
}
