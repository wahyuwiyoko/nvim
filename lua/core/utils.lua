local M = {}

function M.merge_table(table1, table2)
  if table1 == table2 == nil then
    return {}
  end

  if table1 == nil then
    return table2
  end

  if table2 == nil then
    return table1
  end

  return vim.tbl_deep_extend("force", table1, table2)
end

function M.map(mode, key, commands, opts)
  local options = { noremap = true, silent = true }

  if opts then
    options = M.merge_table(options, opts)
  end

  vim.keymap.set(mode, key, commands, opts)
end

return M
