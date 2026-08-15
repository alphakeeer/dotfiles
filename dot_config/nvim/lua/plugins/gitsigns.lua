return {
  {
    "lewis6991/gitsigns.nvim",

    event = {
      "BufReadPre",
      "BufNewFile",
    },

    opts = {
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },

      signs_staged = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },

      signcolumn = true,
      numhl = false,
      linehl = false,

      word_diff = false,

      current_line_blame = false,

      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 700,
        ignore_whitespace = false,
      },

      preview_config = {
        border = "rounded",
      },

      on_attach = function(bufnr)
        local gs = require("gitsigns")

        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, {
            buffer = bufnr,
            silent = true,
            desc = desc,
          })
        end

        -- ======================================================
        -- Hunk navigation
        -- ======================================================

        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gs.nav_hunk("next")
          end
        end, "Next Git Hunk")

        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end, "Previous Git Hunk")

        -- ======================================================
        -- Hunk actions
        -- ======================================================

        map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
        map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")

        map("v", "<leader>hs", function()
          gs.stage_hunk({
            vim.fn.line("."),
            vim.fn.line("v"),
          })
        end, "Stage Hunk")

        map("v", "<leader>hr", function()
          gs.reset_hunk({
            vim.fn.line("."),
            vim.fn.line("v"),
          })
        end, "Reset Hunk")

        map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")

        map("n", "<leader>hi", gs.preview_hunk_inline, "Preview Hunk Inline")

        map("n", "<leader>hb", function()
          gs.blame_line({
            full = true,
          })
        end, "Blame Line")

        map("n", "<leader>hd", gs.diffthis, "Git Diff")

        -- ======================================================
        -- Toggles
        -- ======================================================

        map(
          "n",
          "<leader>hB",
          gs.toggle_current_line_blame,
          "Toggle Line Blame"
        )

        map(
          "n",
          "<leader>hw",
          gs.toggle_word_diff,
          "Toggle Word Diff"
        )

        -- Git hunk text object
        map(
          { "o", "x" },
          "ih",
          gs.select_hunk,
          "Git Hunk"
        )
      end,
    },
  },
}
