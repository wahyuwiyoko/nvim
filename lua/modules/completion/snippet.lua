return {
  "L3MON4D3/LuaSnip",
  version = "2.x.x",
  event = "InsertEnter",
  build = "make install_jsregexp",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function ()
    local luasnip = require("luasnip")
    local types = require("luasnip.util.types")

    luasnip.setup({
      history = true,
      update_events = { "TextChanged", "TextChangedI" },
      store_selection_keys = "<Tab>",
      ext_opts = {
        [types.choiceNode] = {
          active = {
            virt_text = { { "<= Choice Node", "Comment" } }
          }
        }
      }
    })

    require("luasnip.loaders.from_vscode").lazy_load()
    --[[ require("luasnip.loaders.from_lua").load({
      paths = vim.fn.stdpath("config") .. "/lua/snippets/"
    }) ]]
  end
}
