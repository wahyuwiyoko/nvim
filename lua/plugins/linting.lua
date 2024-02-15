local linting = { "mfussenegger/nvim-lint" }

linting.event = { "BufReadPre", "BufNewFile" }

function linting.config()
  local lint = require("lint")

  lint.linters_by_ft = {
    lua = { "selene" },
    sh = { "shellcheck" },
    go = { "golangcilint" },
  }

  vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    group = vim.api.nvim_create_augroup("Linter", { clear = true }),
    callback = function()
      lint.try_lint()
    end,
  })
end

return linting
