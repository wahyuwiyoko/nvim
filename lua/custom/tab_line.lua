local M = {}

local function get_tab_name(tab_page, tab_number)
  local window = vim.api.nvim_tabpage_get_win(tab_page)
  local buffer = vim.api.nvim_win_get_buf(window)
  local buffer_name = vim.api.nvim_buf_get_name(buffer)
  local buffer_base_name = vim.fn.fnamemodify(buffer_name, ":t")
  local buffer_total = vim.fn.tabpagewinnr(tab_number, "$")
  local buffer_is_modified = vim.api.nvim_buf_get_option(buffer, "modified")
  local buffer_is_unnamed = buffer_base_name == ""
  local is_current_tab_page = tab_page == vim.api.nvim_get_current_tabpage()

  if buffer_is_unnamed then
    if is_current_tab_page then
      buffer_base_name = "%{&filetype != '' ? &filetype .. '' : '[No Name]'}"
    else
      buffer_base_name = "[No Name]"
    end
  end

  if buffer_is_modified then
    buffer_base_name = buffer_base_name .. " [+]"
  end

  if buffer_total > 1 then
    buffer_base_name = buffer_total .. " " .. buffer_base_name
  end

  return buffer_base_name
end

function M.tab_line()
  local tab_line = "%#TabLine#"

  for tab_number, tab_page in ipairs(vim.api.nvim_list_tabpages()) do
    local buffer_name = get_tab_name(tab_page, tab_number)
    local is_current_tab_page = tab_page == vim.api.nvim_get_current_tabpage()

    if is_current_tab_page then
      tab_line = tab_line .. " %#TabLineSel# " .. buffer_name .. " %#TabLine#"
    else
      tab_line = tab_line .. " %#TabLine#" .. buffer_name .. " "
    end
  end

  return tab_line
end

return M
