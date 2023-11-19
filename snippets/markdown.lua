--- @diagnostic disable: undefined-global
--# selene: allow(undefined_variable)

local alert = [[
> [!{}]
> {}
]]

return {
  s("alert", fmt(alert, {
    c(1, {
      i(1, "NOTE"), i(2, "TIP"), i(3, "IMPORTANT"),
      i(4, "WARNING"), i(5, "CAUTION")
    }),
    i(2)
  }))
}
