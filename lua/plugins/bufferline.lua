local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
  return
end

local highlights = require("rose-pine.plugins.bufferline")

bufferline.setup({
  options = {
    mode = "buffers",
    themable = true,
    numbers = "none",
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator = { icon = "▎", style = "icon" },
    buffer_close_icon = "X",
    modified_icon = "M",
    close_icon = "X",
    max_name_length = 18,
    max_prefix_length = 15,
    truncate_names = true,
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true
      }
    },
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    separator_style = "thin",
    enforce_regular_tabs = true,
    always_show_bufferline = true
  },
  highlights = highlights
})
