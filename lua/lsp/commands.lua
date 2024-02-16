local commands = {}

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command
local fmt = string.format

local clear = { clear = true }
local force = { force = true }

function commands.autostart(server, callback)
  autocmd("FileType", {
    group = augroup(fmt("LSP_%s", server.name), clear),
    pattern = server.filetypes,
    desc = fmt(
      "Check whether server %s should start a new instance",
      server.name
    ),
    callback = callback,
  })
end

function commands.attach(desc, callback)
  autocmd("LspAttach", {
    group = augroup("LspAttached", clear),
    desc = desc,
    callback = callback,
  })
end

function commands.user(client_id)
  usercmd("LspInfo", function()
    print(vim.inspect(vim.lsp.get_client_by_id(client_id)))
  end, force)

  usercmd("LspLog", function()
    -- TODO: Debug log level for more details
    -- vim.lsp.set_log_level("debug")

    vim.cmd("tabnew")
    vim.cmd.edit(vim.lsp.get_log_path())
  end, force)
end

return commands
