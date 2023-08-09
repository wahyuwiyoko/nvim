local status_ok, lualine = pcall(require, "lualine")

if not status_ok then
  return
end

lualine.setup({
  options = {
    icons_enabled = false,
    theme = "rose-pine",
    component_separators = { left = "|", right = "|" },
    section_separators = "",
    globalstatus = true
  },
  sections = {
    lualine_c = {
      { "filename", path = 1 }
    }
  },
  tabline = {
    lualine_a = {
      {
        "buffers",
        symbols = {
          modified = " M",
          alternate_file = "",
          directory = " D"
        }
      }
    },
    lualine_z = { "tabs" }
  }
})
