local status_ok, toggleterm = pcall(require, "toggleterm")

if not status_ok then
  return
end

local highlights = require("rose-pine.plugins.toggleterm")

toggleterm.setup({
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  highlights = highlights,
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = { border = "single", winblend = 0 }
})
