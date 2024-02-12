return {
  "L3MON4D3/LuaSnip",
  version = "2.x.x",
  event = "InsertEnter",
  build = "make install_jsregexp",
  config = function()
    local types = require("luasnip.util.types")

    require("luasnip").setup({
      history = true,
      update_events = { "TextChanged", "TextChangedI" },
      enable_autosnippets = false,
      ext_opts = {
        [types.choiceNode] = {
          active = {
            virt_text = { { "<= Choice Node", "Comment" } },
          },
        },
      },
    })

    require("luasnip.loaders.from_lua").load({
      paths = vim.fn.stdpath("config") .. "/snippets/",
    })
  end,
}
