local options = {}

local fmt = string.format

function options.on_exit(code, signal, client_id)
  local prefix = fmt("[Client %s]", tostring(client_id))

  print(fmt("%s LSP exited with code %s", prefix, tostring(code)))

  if signal ~= nil then
    print(fmt("%s Signal %s", prefix, tostring(signal)))
  end

  vim.schedule_wrap(function()
    local group = fmt("LSP_%s", vim.lsp.get_client_by_id(client_id).config.name)

    if vim.fn.exists(fmt("#%s", group)) == 1 then
      vim.api.nvim_del_augroup_by_name(group)
    end
  end)
end

return options
