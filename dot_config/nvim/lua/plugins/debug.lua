return {
  -- ============================================================
  -- Core DAP client
  -- ============================================================

  {
    "mfussenegger/nvim-dap",
    lazy = false,

    keys = {
      -- VSCode-like function keys
      {
        "<F5>",
        function()
          require("dap").continue()
        end,
        desc = "Debug: Continue",
      },

      {
        "<F9>",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Debug: Toggle Breakpoint",
      },

      {
        "<F10>",
        function()
          require("dap").step_over()
        end,
        desc = "Debug: Step Over",
      },

      {
        "<F11>",
        function()
          require("dap").step_into()
        end,
        desc = "Debug: Step Into",
      },

      {
        "<S-F11>",
        function()
          require("dap").step_out()
        end,
        desc = "Debug: Step Out",
      },

      -- Leader based controls
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },

      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },

      {
        "<leader>dB",
        function()
          require("dap").set_breakpoint(
            vim.fn.input("Breakpoint condition: ")
          )
        end,
        desc = "Conditional Breakpoint",
      },

      {
        "<leader>dL",
        function()
          require("dap").set_breakpoint(
            nil,
            nil,
            vim.fn.input("Log point message: ")
          )
        end,
        desc = "Log Point",
      },

      {
        "<leader>dn",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },

      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },

      {
        "<leader>do",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },

      {
        "<leader>dp",
        function()
          require("dap").pause()
        end,
        desc = "Pause",
      },

      {
        "<leader>dt",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },

      {
        "<leader>dr",
        function()
          require("dap").repl.toggle()
        end,
        desc = "Toggle REPL",
      },

      {
        "<leader>dR",
        function()
          require("dap").run_last()
        end,
        desc = "Run Last",
      },
    },

    config = function()
      local dap = require("dap")

      -- Don't let DAP unexpectedly replace debugger UI windows.
      dap.defaults.fallback.switchbuf =
        "usevisible,usetab,newtab"

      -- ========================================================
      -- Debug signs
      -- ========================================================

      local signs = {
        DapBreakpoint = {
          text = "●",
          texthl = "DiagnosticError",
        },

        DapBreakpointCondition = {
          text = "◆",
          texthl = "DiagnosticWarn",
        },

        DapBreakpointRejected = {
          text = "○",
          texthl = "DiagnosticError",
        },

        DapLogPoint = {
          text = "◆",
          texthl = "DiagnosticInfo",
        },

        DapStopped = {
          text = "▶",
          texthl = "DiagnosticWarn",
        },
      }

      for name, sign in pairs(signs) do
        vim.fn.sign_define(name, sign)
      end
    end,
  },

  -- ============================================================
  -- Install and configure debug adapters through Mason
  -- ============================================================

  {
    "jay-babu/mason-nvim-dap.nvim",
    lazy = false,

    dependencies = {
      "mason-org/mason.nvim",
      "mfussenegger/nvim-dap",
    },

    opts = {
      ensure_installed = {
        "python",
        "codelldb",
      },

      -- Required for predefined adapter setup.
      handlers = {},
    },
  },

  -- ============================================================
  -- Modern debugging UI
  -- ============================================================

  {
    "igorlfs/nvim-dap-view",
    version = "1.*",
    lazy = false,

    dependencies = {
      "mfussenegger/nvim-dap",
    },

    config = function()
      local dap = require("dap")
      local dapview = require("dap-view")

      dapview.setup({
        follow_tab = true,
      })

      -- Automatically open the debugger UI when a session starts.
      dap.listeners.after.event_initialized["dap_view"] = function()
        dapview.open()
      end

      -- Clean up when debugging finishes.
      dap.listeners.before.event_terminated["dap_view"] = function()
        dapview.close()
      end

      dap.listeners.before.event_exited["dap_view"] = function()
        dapview.close()
      end
    end,

    keys = {
      {
        "<leader>du",
        function()
          require("dap-view").toggle()
        end,
        desc = "Toggle Debug UI",
      },

      {
        "<leader>de",
        function()
          require("dap-view").hover()
        end,
        mode = { "n", "v" },
        desc = "Evaluate",
      },

      {
        "<leader>dv",
        function()
          require("dap-view").virtual_text_toggle()
        end,
        desc = "Toggle Debug Virtual Text",
      },
    },
  },
}
