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

-- When connected over SSH, send clipboard copies back through
-- the terminal instead of copying into the remote machine's
-- desktop clipboard.
if M.is_ssh then
  vim.g.clipboard = "osc52"
end

return M
