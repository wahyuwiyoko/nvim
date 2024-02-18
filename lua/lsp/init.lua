local commands = require("lsp.commands")
local config = require("lsp.config")

local function servers()
  local server_names = {}
  local server_dir = vim.fs.dir(vim.fn.stdpath("config") .. "/lua/lsp/servers/")

  for file_name, type in server_dir do
    if type == "file" then
      table.insert(server_names, vim.fn.fnamemodify(file_name, ":r"))
    end
  end

  return server_names
end

local function start_server(opts)
  local client_id = vim.lsp.start(config.options(opts))

  vim.lsp.buf_attach_client(0, client_id)
end

local function load()
  config.diagnostic()

  for _, server in ipairs(servers()) do
    local server_opts = require("lsp.servers." .. server)

    commands.autostart(server_opts, function()
      start_server(server_opts)
    end)
  end
end

load()
