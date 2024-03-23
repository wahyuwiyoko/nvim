--- @diagnostic disable: undefined-global

return {
  s("inspect", fmt("print(vim.inspect({}))", { i(1) })),
}
