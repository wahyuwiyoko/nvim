--- @diagnostic disable: undefined-global
--# selene: allow(undefined_variable)

local module = [[
local M = {{}}

M.{} = {}

return M
]]

local func = [[
function ({})
  {}
end
]]

return {
  s("M", fmt(module, {
    i(1, "module"),
    c(2, {
      fmt(func, {
        i(1, "args"),
        i(2)
      }),
      i(1, "value")
    })
  }))
}
