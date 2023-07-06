local status_ok, lualine = pcall(require, "lualine")

if not status_ok then
  return
end

lualine.setup({
  options = {
    icons_enabled = false,
    theme = "rose-pine",
    component_separators = { left = "|", right = "|" },
    section_separators = ""
  }
})
