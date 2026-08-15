return {
  {
    "saghen/blink.cmp",

    -- Stay on stable V1.
    version = "1.*",

    event = {
      "InsertEnter",
      "CmdlineEnter",
    },

    dependencies = {
      "rafamadriz/friendly-snippets",
    },

    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
      -- VSCode-like:
      -- Tab accepts / advances snippets
      -- Shift-Tab moves backwards
      keymap = {
        preset = "super-tab",
      },

      appearance = {
        nerd_font_variant = "mono",
      },

      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 250,
        },

        ghost_text = {
          enabled = true,
        },
      },

      signature = {
        enabled = true,
      },

      sources = {
        default = {
          "lazydev",
          "lsp",
          "path",
          "snippets",
          "buffer",
        },

        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },

      fuzzy = {
        implementation = "prefer_rust",
      },
    },

    opts_extend = {
      "sources.default",
    },
  },
}
