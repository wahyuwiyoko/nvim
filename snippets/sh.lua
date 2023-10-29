--- @diagnostic disable: undefined-global
--# selene: allow(undefined_variable)

return {
  s("!", fmt("#!/bin/{}", {
    c(1, {
      t("sh"),
      t("bash")
    })
  }))
}
