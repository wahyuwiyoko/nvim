local editor = {
  autoclose = { "m4xshen/autoclose.nvim" },
  surround = { "kylechui/nvim-surround" },
}

editor.autoclose.event = "InsertEnter"

editor.autoclose.opts = {
  options = {
    disabled_filetypes = { "TelescopePrompt" },
    pair_spaces = true,
  },
}

editor.surround.event = { "BufReadPre", "BufNewFile" }

editor.surround.config = true

return { editor.autoclose, editor.surround }
