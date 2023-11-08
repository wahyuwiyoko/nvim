--- @diagnostic disable: undefined-global
--# selene: allow(undefined_variable)

local main_func = [[
package main

func main() {{
  {}
}}
]]

return {
  s("main", fmt(main_func, { i(1) })),
  s("v", fmt("{} := {}", { i(1, "name"), i(2, "value") })),
  s("arr", fmt("var {}", {
    c(1, {
      fmt("{} [{}]{}", { i(1, "name"), i(2, "1"), i(3, "type") }),
      fmt("{} = [{}]{} {{{}}}", {
        i(1, "name"), i(2, "1"), i(3, "type"), i(4)
      })
    })
  }))
}
