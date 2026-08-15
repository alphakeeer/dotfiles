return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,

    opts = {
      flavour = "mocha",
      transparent_background = true,
      term_colors = true,

      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
      },

      default_integrations = true,
      auto_integrations = true,
    },

    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
