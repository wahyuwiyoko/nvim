local commands = {}

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command

local lsp = vim.lsp
local fmt = string.format

function commands.autostart(server, callback)
  autocmd("FileType", {
    group = augroup(fmt("LSP_%s", server.name), { clear = true }),
    pattern = server.filetypes,
    desc = fmt(
      "Check whether server %s should start a new instance",
      server.name
    ),
    callback = callback,
  })
end

function commands.user()
  usercmd("LspInfo", function()
    print(
      vim.inspect(
        lsp.get_active_clients({ bufnr = vim.api.nvim_win_get_buf(0) })[1]
      )
    )
  end, {
    desc = "Show active LSP client information",
  })

  usercmd("LspLog", function()
    vim.cmd(fmt("tabnew %s", lsp.get_log_path()))
  end, {
    desc = "Open the LSP client log",
  })
end

return commands
