local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command

local clear = { clear = true }
local force = { force = true }

augroup("FileFormat", clear)
augroup("TerminalMode", clear)
augroup("CommandMode", clear)

autocmd("BufWritePre", {
  group = "FileFormat",
  pattern = "*",
  desc = "Remove trailing whitespace",
  callback = function()
    local save_cursor_position = vim.fn.winsaveview()

    vim.cmd([[%s/\s\+$//e]])

    vim.fn.winrestview(save_cursor_position)
  end,
})

autocmd("InsertEnter", {
  group = "FileFormat",
  pattern = "*",
  desc = "Disable auto comment at new line",
  callback = function()
    vim.opt_local.formatoptions = {
      c = false,
      r = false,
      o = false,
    }
  end,
})

autocmd("TermOpen", {
  group = "TerminalMode",
  desc = "Start terminal in insert mode",
  command = "set filetype=term | startinsert",
})

autocmd("BufWritePre", {
  group = "CommandMode",
  desc = "Auto create directory",
  callback = function(context)
    local directory = vim.fn.fnamemodify(context.file, ":p:h")

    if vim.fn.isdirectory(directory) == 0 then
      vim.fn.mkdir(directory, "p")
    end
  end,
})

usercmd("MasonInstallTools", function()
  local registry = require("mason-registry")
  local tools = { "selene", "shellcheck", "stylua", "golangci-lint" }

  for _, tool in ipairs(tools) do
    if not registry.is_installed(tool) then
      vim.cmd("MasonInstall " .. tool)
    end
  end
end, force)

usercmd("JSONFormat", function()
  if vim.fn.executable("jq") == 1 then
    vim.cmd("%!jq .")
  end
end, force)
