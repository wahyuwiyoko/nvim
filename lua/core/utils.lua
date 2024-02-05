local M = {}

function M.executable(name)
  if vim.fn.executable(name) > 0 then
    return true
  else
    vim.notify(name .. " executable not found!", vim.log.levels.INFO)

    return false
  end
end

function M.has(feat)
  if vim.fn.has(feat) == 1 then
    return true
  end

  return false
end

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

function M.highlight(group, attribute)
  return vim.api.nvim_set_hl(0, group, attribute)
end

function M.split_string(str, delimeter)
  local result = {}

  for match in (str .. delimeter):gmatch("(.-)" .. delimeter) do
    table.insert(result, match)
  end

  return result
end

return M
