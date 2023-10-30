--- @diagnostic disable: undefined-global
--# selene: allow(undefined_variable)

local main_func = [[
package main

func main() {{
  {}
}}
]]

return {
  s("main", fmt(main_func, { i(1) }))
}
