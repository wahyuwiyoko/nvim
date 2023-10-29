return {
  "L3MON4D3/LuaSnip",
  version = "2.x.x",
  event = "InsertEnter",
  build = "make install_jsregexp",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function ()
    local types = require("luasnip.util.types")

    require("luasnip").setup({
      history = true,
      update_events = { "TextChanged", "TextChangedI" },
      enable_autosnippets = false,
      store_selection_keys = "<Tab>",
      ext_opts = {
        [types.choiceNode] = {
          active = {
            virt_text = { { "<= Choice Node", "Comment" } }
          }
        }
      }
    })

    -- Load friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Load custom snippets
    require("luasnip.loaders.from_lua").load({
      paths = vim.fn.stdpath("config") .. "/snippets/"
    })
  end
}
