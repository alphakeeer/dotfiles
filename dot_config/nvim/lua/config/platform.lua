local M = {}

M.is_mac = vim.fn.has("macunix") == 1
M.is_linux = vim.fn.has("unix") == 1 and not M.is_mac

M.is_ssh = vim.env.SSH_CONNECTION ~= nil
  or vim.env.SSH_TTY ~= nil

M.has = function(command)
  return vim.fn.executable(command) == 1
end

M.os = M.is_mac and "macOS"
  or M.is_linux and "Linux"
  or "Unknown"

-- Universal clipboard scheme over SSH:
-- 1. SSH + tmux: nvim's y/p go through tmux buffers. This does not
--    depend on the outer terminal at all, so it works instantly no
--    matter which computer/terminal the SSH session comes from.
--    Paste into another tmux window with <prefix>] (Ctrl-b ]).
-- 2. SSH without tmux: do not let nvim manage the system clipboard,
--    otherwise pasting triggers an OSC 52 query that blocks for ~10s
--    on terminals that do not answer. Use the terminal's own paste
--    (e.g. Ctrl+Shift+V) instead.
if M.is_ssh then
  if vim.env.TMUX then
    vim.g.clipboard = "tmux"
  else
    vim.g.ssh_without_tmux = true
  end
end

-- On SSH without tmux, still try to push yanked text to the local
-- desktop clipboard, but only when the terminal declares OSC 52 support
-- (fire-and-forget, never waits for a response).
if M.is_ssh and not vim.env.TMUX then
  vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
      if vim.v.event.operator == "y"
          and vim.g.termfeatures ~= nil
          and vim.g.termfeatures.osc52 then
        local text = vim.fn.getreg('"')
        if text ~= "" then
          vim.api.nvim_ui_send(string.format("\027]52;c;%s\027\\", vim.base64.encode(text)))
        end
      end
    end,
  })
end

return M
