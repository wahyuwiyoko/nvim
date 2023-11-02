local M = {}

M.executable = function (name)
  if vim.fn.executable(name) > 0 then
    return true
  else
    vim.notify(name .. " executable not found!", vim.log.levels.INFO)

    return false
  end
end

M.has = function (feat)
  if vim.fn.has(feat) == 1 then
    return true
  end

  return false
end

M.merge = function (...)
  return vim.tbl_deep_extend("force", ...)
end

M.map = function (mode, key, commands, opts)
  local options = { noremap = true, silent = true }

  if opts then
    options = M.merge(options, opts)
  end

  vim.keymap.set(mode, key, commands, opts)
end

return M
