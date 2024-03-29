local completion = { "hrsh7th/nvim-cmp" }

completion.version = false

completion.event = "InsertEnter"

completion.dependencies = {
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "saadparwaiz1/cmp_luasnip",
}

function completion.config()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  local mapping = cmp.mapping

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    preselect = cmp.PreselectMode.None,
    mapping = {
      ["<C-k>"] = mapping.select_prev_item({
        behavior = cmp.SelectBehavior.Select,
      }),
      ["<C-j>"] = mapping.select_next_item({
        behavior = cmp.SelectBehavior.Select,
      }),
      ["<C-g>"] = function()
        if cmp.visible_docs() then
          cmp.close_docs()
        else
          cmp.open_docs()
        end
      end,
      ["<C-u>"] = mapping.scroll_docs(-4),
      ["<C-d>"] = mapping.scroll_docs(4),
      ["<C-s>"] = mapping.complete(),
      ["<C-e>"] = mapping.abort(),
      ["<CR>"] = mapping.confirm({
        select = true,
        behavior = cmp.ConfirmBehavior.Replace,
      }),
      ["<C-l>"] = cmp.mapping(function(fallback)
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif luasnip.jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<C-h>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<C-m>"] = cmp.mapping(function(fallback)
        if luasnip.choice_active() then
          luasnip.change_choice(1)
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
    },
    view = {
      docs = {
        auto_open = false,
      },
    },
  })
end

return completion
