local auto = vim.api.nvim_create_autocmd

local function group(name)
  vim.api.nvim_create_augroup(name, { clear = true })
end

local function user(name, callback)
  vim.api.nvim_create_user_command(name, callback, { force = true })
end

auto("BufWritePre", {
  group = group("RemoveTrailingWhitespace"),
  pattern = "*",
  callback = function()
    local save_cursor = vim.fn.winsaveview()

    vim.cmd([[%s/\s\+$//e]])

    vim.fn.winrestview(save_cursor)
  end,
})

auto("InsertEnter", {
  group = group("DisableAutoComment"),
  pattern = "*",
  callback = function()
    vim.opt.formatoptions = { c = false, r = false, o = false }
  end,
})

auto("TermOpen", {
  group = group("StartTerminalInInsertMode"),
  command = "set filetype=term | startinsert",
})

auto("BufWritePre", {
  group = group("AutoCreateDirectory"),
  pattern = "*",
  callback = function(context)
    local directory = vim.fn.fnamemodify(context.file, ":p:h")

    if vim.fn.isdirectory(directory) == 0 then
      vim.fn.mkdir(directory, "p")
    end
  end,
})

auto("BufRead", {
  group = group("NonUTF8File"),
  pattern = "*",
  callback = function()
    if vim.bo.fileencoding ~= "utf-8" then
      vim.notify("File is not in UTF-8 format!", vim.log.levels.WARN)
    end
  end,
})

user("Term", function()
  vim.cmd("tabnew | terminal")
end)

user("MasonInstallTools", function()
  local registry = require("mason-registry")
  local tools = { "selene", "shellcheck", "stylua", "golangci-lint" }

  for _, tool in ipairs(tools) do
    if not registry.is_installed(tool) then
      vim.cmd("MasonInstall " .. tool)
    end
  end
end)

user("JSONFormat", function()
  if vim.fn.executable("jq") == 1 then
    vim.cmd("%!jq .")
  end
end)
