local function augroup(group_name)
  return vim.api.nvim_create_augroup(group_name, { clear = true })
end

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
  group = augroup("RemoveTrailingWhitespace"),
  pattern = "*",
  callback = function ()
    local save_cursor = vim.fn.winsaveview()
    vim.cmd([[ %s/\s\+$//e ]])
    vim.fn.winrestview(save_cursor)
  end
})

autocmd("TermOpen", {
  group = augroup("StartTerminalInInsertMode"),
  command = "startinsert | set winfixheight"
})
