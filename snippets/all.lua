--- @diagnostic disable: undefined-global
--# selene: allow(undefined_variable)

return {
  s("dateBdY", t(os.date("%B %d, %Y"))),
  s(
    "todo",
    fmt("{}: {}", {
      c(1, {
        i(1, "TODO"),
        i(2, "FIX"),
        i(3, "NOTE"),
        i(4, "WARNING"),
        i(5, "HACK"),
        i(6, "PERF"),
        i(7, "TEST"),
      }),
      i(2),
    })
  ),
}
