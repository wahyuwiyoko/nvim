local commands = require("lsp.commands")
local config = require("lsp.config")
local options = require("lsp.options")

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
  vim.lsp.start(config.options(opts), {
    reuse_client = function(client, client_config)
      client_config.root_dir = options.root_dir(opts.root_pattern)

      local root_dir = client.config.root_dir == client_config.root_dir
      local filetypes = client.config.filetypes == client_config.filetypes

      if root_dir and filetypes then
        return true
      end

      return false
    end,
    bufnr = vim.api.nvim_win_get_buf(0),
  })
end

for _, server in ipairs(servers()) do
  local server_opts = require("lsp.servers." .. server)

  commands.autostart(server_opts, function()
    start_server(server_opts)
  end)
end
