--- @diagnostic disable: undefined-global
--# selene: allow(undefined_variable)

local async_func = [[
async function {}({}) {{
  const {} = await {};
  {}
}}
]]

return {
  s("dgi", fmt("document.getElementById({});", {
    i(1, "id")
  })),
  s("dqa", fmt("document.querySelectorAll({});", {
    i(1, "selector")
  })),
  s("async-func", fmt(async_func, {
    i(1, "name"),
    i(2, "args"),
    i(3, "name"),
    i(4, "name"),
    i(5)
  }))
}
