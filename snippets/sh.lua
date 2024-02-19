--- @diagnostic disable: undefined-global

return {
  s(
    "!",
    fmt("#!/bin/{}", {
      c(1, { i(1, "sh"), i(2, "bash") }),
    })
  ),
}
