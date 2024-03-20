local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command

local clear = { clear = true }

augroup("AutoFormatFile", clear)
augroup("TerminalMode", clear)
augroup("CommandMode", clear)

autocmd("BufWritePre", {
  group = "AutoFormatFile",
  pattern = "*",
  desc = "Remove trailing whitespace",
  callback = function()
    local cursor_position = vim.api.nvim_win_get_cursor(0)

    vim.cmd([[%s/\s\+$//e]])

    vim.api.nvim_win_set_cursor(0, cursor_position)
  end,
})

autocmd("TermOpen", {
  group = "TerminalMode",
  desc = "Start terminal in insert mode",
  command = "setlocal nonumber norelativenumber filetype=term | startinsert",
})

usercmd("Fd", function(input)
  vim.cmd.edit(input.args)
end, {
  nargs = 1,
  desc = "Find files",
  complete = function(arglead)
    local cmd = string.format("fdfind --type file --color never '%s'", arglead)
    return vim.fn.systemlist(cmd)
  end,
})

autocmd("BufWritePre", {
  group = "CommandMode",
  desc = "Auto create directory",
  callback = function(context)
    local directory = vim.fn.fnamemodify(context.file, ":p:h")

    if vim.fn.isdirectory(directory) == 0 then
      vim.fn.mkdir(directory, "p")
    end
  end,
})
