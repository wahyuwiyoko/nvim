return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    {
      "L3MON4D3/LuaSnip",
      version = "2.x.x",
      build = "make install_jsregexp",
      dependencies = { "rafamadriz/friendly-snippets" },
      config = function ()
        require("luasnip.loaders.from_vscode").lazy_load()
      end
    }
  },
  config = function ()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },
      window = {
        completion = {
          border = "single",
          scrollbar = false,
          scrolloff = 2
        },
        documentation = {
          border = "single",
          max_height = 15,
          max_width = 60,
          winhighlight = "FloatBorder:Pmenu"
        }
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-l>"] = cmp.mapping(function(fallback)
          if luasnip.choice_active() then
            luasnip.change_choice(1)
          else
            fallback()
          end
        end, { "i", "s" })
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "nvim_lsp_signature_help" },
        { name = "luasnip", option = { show_autosnippets = true } },
        { name = "buffer" },
        { name = "path" }
      },
      formatting = {
        format = function (entry, vim_item)
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            nvim_lua = "[Lua]",
            nvim_lsp_signature_help = "[Help]",
            luasnip = "[LuaSnip]",
            buffer = "[Buffer]",
            path = "[Path]"
          })[entry.source.name]

          return vim_item
        end
      }
    })

    cmp.event:on(
      "confirm_done",
      require("nvim-autopairs.completion.cmp").on_confirm_done({
        filetypes = {
          sh = false
        }
      })
    )
  end
}
