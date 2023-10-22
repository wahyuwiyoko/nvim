return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<Leader>tl",
      function () require("lint").try_lint() end,
      desc = "Trigger linter"
    }
  },
  config = function ()
    local lint = require("lint")

    lint.linters_by_ft = {
      lua = { "selene" },
      sh = { "shellcheck" }
    }

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("Linter", { clear = true }),
      callback = function ()
        lint.try_lint()
      end
    })
  end
}
