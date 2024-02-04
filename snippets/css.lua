--- @diagnostic disable: undefined-global
--# selene: allow(undefined_variable)

local font_face = [[
@font-face {{
  font-family: "{}";
  font-style: {};
  font-weight: {};
  font-display: {};
  src: url("{}") format("{}");
}}
]]

local dark_color = [[
@media (prefers-color-scheme: dark) {{
  {}
}}
]]

local media_query = [[
@media screen and ({}-width: {}) {{
  {}
}}
]]

return {
  s(
    "font-face",
    fmt(font_face, {
      i(1),
      i(2, "normal"),
      i(3, "400"),
      i(4, "swap"),
      i(5),
      c(6, { i(1, "woff2"), i(2, "woff") }),
    })
  ),
  s("dark", fmt(dark_color, { i(1) })),
  s(
    "media-query",
    fmt(media_query, {
      c(1, { i(1, "min"), i(2, "max") }),
      i(2),
      i(3),
    })
  ),
}
