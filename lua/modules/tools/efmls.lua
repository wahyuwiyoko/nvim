return {
  "creativenull/efmls-configs-nvim",
  version = "v1.x.x",
  event = { "BufReadPre", "BufNewFile" },
  config = function ()
    local languages = {
      sh = { require("efmls-configs.linters.shellcheck") },
      lua = { require("efmls-configs.linters.selene") },
      markdown = { require("efmls-configs.linters.markdownlint") }
    }

    local efmls_config = {
      filetypes = vim.tbl_keys(languages),
      settings = { languages = languages }
    }

    require("lspconfig").efm.setup(vim.tbl_extend("force", efmls_config, {}))
  end
}
