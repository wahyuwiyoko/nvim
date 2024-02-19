--- @diagnostic disable: undefined-global

local code_block = [[
```{}
{}
```
]]

local alert = [[
> [!{}]
> {}
]]

return {
  s("bold", fmt("**{}**", { i(1, "bold") })),
  s("italic", fmt("*{}*", { i(1, "italic") })),
  s("strikethrough", fmt("~~{}~~", { i(1, "strikethrough") })),
  s("link", fmt("[{}]({})", { i(1, "text"), i(2, "link") })),
  s("img", fmt("![{}]({})", { i(1, "alt"), i(2, "path") })),
  s("code", fmt(code_block, { i(1, "language"), i(2) })),
  s(
    "alert",
    fmt(alert, {
      c(1, {
        i(1, "NOTE"),
        i(2, "TIP"),
        i(3, "IMPORTANT"),
        i(4, "WARNING"),
        i(5, "CAUTION"),
      }),
      i(2),
    })
  ),
}
