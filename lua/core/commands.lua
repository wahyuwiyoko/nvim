local function augroup(group_name)
  return vim.api.nvim_create_augroup(group_name, { clear = true })
end

local auto = vim.api.nvim_create_autocmd
local user = vim.api.nvim_create_user_command

auto("BufWritePre", {
  group = augroup("RemoveTrailingWhitespace"),
  pattern = "*",
  callback = function ()
    local save_cursor = vim.fn.winsaveview()
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.winrestview(save_cursor)
  end
})

auto("TermOpen", {
  group = augroup("StartTerminalInInsertMode"),
  command = "startinsert | set winfixheight"
})

user("MasonInstallLinters", function ()
  local registry = require("mason-registry")
  local linters = { "selene", "shellcheck", "markdownlint" }

  for _, linter in ipairs(linters) do
    if not registry.is_installed(linter) then
      vim.cmd("MasonInstall " .. linter)
    end
  end
end, { force = true })
