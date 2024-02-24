local comment = {}

local modes = {
  with_range = { "v", "V", "\22", "\22s", "s", "S" },
  not_supported = { "o", "c", "cv", "ce", "!", "t" },
}

local line_comment = "%s%s%s"
local block_comment = "%s%s%s%s"

local api = vim.api
local fn = vim.fn
local len = fn.len

local sub = string.sub
local find = string.find
local fmt = string.format

local function is_empty_string(str)
  if fn.empty(str) == 1 then
    return true
  end

  return false
end

local function is_comment(text, opts)
  local _, indent_size = find(text, "^(%s*)")
  local code = sub(text, indent_size + 1)

  return vim.startswith(code, opts.left)
end

local function comment_line(text, opts)
  if is_empty_string(text) then
    return text
  end

  local indent_sizes = opts.indent_sizes
  local _, indent_size, padding = find(text, "^(%s*)")
  local default_indent = indent_size > indent_sizes[2]

  if default_indent then
    indent_size = indent_sizes[2]
    padding = indent_sizes[3]
  end

  local code = sub(text, indent_size + 1)

  if is_empty_string(opts.right) then
    return fmt(line_comment, padding, opts.left, code)
  end

  return fmt(block_comment, padding, opts.left, code, fmt(" %s", opts.right))
end

local function uncomment_line(text, opts)
  if is_empty_string(text) then
    return text
  end

  local start_comment_index = find(text, sub(opts.left, 1, 1))
  local left_comment_index = start_comment_index + len(opts.left)
  local end_comment_index

  if is_empty_string(opts.right) then
    end_comment_index = len(text)
  else
    end_comment_index = len(text) - len(opts.right)
  end

  local code = sub(text, left_comment_index, end_comment_index)

  if start_comment_index == 1 then
    return code
  end

  local indent_code = sub(text, 1, start_comment_index - 1)

  return fmt("%s%s", indent_code, code)
end

function comment.toggle()
  local comment_string = vim.bo.commentstring

  if is_empty_string(comment_string) or comment_string == nil then
    vim.notify(
      'Cannot comment line. "commentstring" option is empty for the current buffer!',
      vim.log.levels.WARN
    )

    return
  end

  local line_range
  local mode = api.nvim_get_mode().mode

  if vim.tbl_contains(modes.with_range, mode) then
    -- In visual mode
    line_range = {
      start = fn.line("v"),
      ends = fn.line("."),
    }
  elseif vim.tbl_contains(modes.not_supported, mode) then
    vim.notify(
      "Cannot comment line. Current mode is not supported",
      vim.log.levels.WARN
    )

    return
  else
    -- In normal mode
    line_range = {
      start = fn.line("."),
      ends = fn.line("."),
    }
  end

  -- Get `commentstring` and remove `%s`
  local left, right = string.match(comment_string, "^%s*(.*)%%s(.-)%s*$")

  local input = {
    left = fmt("%s ", vim.trim(left)),
    right = vim.trim(right),
  }

  local is_uncomment
  local start_indent_size

  local lines =
    api.nvim_buf_get_lines(0, line_range.start - 1, line_range.ends, true)

  for _, line in ipairs(lines) do
    if len(vim.trim(line)) >= 1 then
      is_uncomment = is_comment(line, input)
      start_indent_size = { find(line, "^(%s*)") }
      break
    end
  end

  if is_uncomment == nil then
    return
  end

  input.indent_sizes = start_indent_size

  local new = {}
  local transform = is_uncomment and uncomment_line or comment_line

  for _, line in ipairs(lines) do
    new[len(new) + 1] = transform(line, input)
  end

  api.nvim_buf_set_lines(0, line_range.start - 1, line_range.ends, false, new)
end

return comment
