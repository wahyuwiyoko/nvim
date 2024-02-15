-- @module core.utils
local utils = {}

-- Merge two table
-- @param table1 table
-- @param table2 table
-- @return table
function utils.merge_table(table1, table2)
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

-- Set a Vim keymap
-- @param mode string|table: Mode short-name
-- @param key string: Key mapping
-- @param commands string|function: Trigger commands
-- @param opts table|nil: Optional parameters map. See `:help map-arguments`
function utils.map(mode, key, commands, opts)
  local options = { noremap = true, silent = true }

  if opts then
    options = utils.merge_table(options, opts)
  end

  vim.keymap.set(mode, key, commands, opts)
end

return utils
