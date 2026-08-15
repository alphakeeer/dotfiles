return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    dependencies = {
      "mason-org/mason.nvim",
    },

    opts = {
      ensure_installed = {
        -- Lua
        "stylua",

        -- Python
        "ruff",

        -- C / C++
        "clang-format",

        -- Shell
        "shfmt",

        -- Web / JSON / YAML / Markdown
        "prettier",
      },

      auto_update = false,
      run_on_start = true,

      -- Don't block startup immediately.
      start_delay = 1000,

      -- Avoid checking every single launch.
      debounce_hours = 24,
    },
  },
}
