local file_name = "%f"
local modified = "%m"
local read_only = "%r"
local align_right = "%="
local file_encoding = "%{&fileencoding}"
local file_format = "%{&fileformat}"
local file_type = "%{&filetype != '' ? &filetype .. '' : 'none'}"
local separator = "|"

return string.format(
  " %s %s %s %s %s %s %s %s %s ",
  file_name,
  modified,
  read_only,
  align_right,
  file_encoding,
  separator,
  file_format,
  separator,
  file_type
)
