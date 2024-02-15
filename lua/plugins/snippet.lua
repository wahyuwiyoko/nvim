local snippet = { "L3MON4D3/LuaSnip" }

snippet.event = "InsertEnter"

snippet.build = "make install_jsregexp"

function snippet.config()
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
end

return snippet
