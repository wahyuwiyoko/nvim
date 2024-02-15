local editor = {
  autoclose = { "m4xshen/autoclose.nvim" },
  surround = { "kylechui/nvim-surround" },
  comment = { "numToStr/Comment.nvim" },
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

editor.comment.keys = {
  {
    mode = { "n", "v", "x" },
    "gc",
    desc = "Toggle line comment",
  },
  {
    mode = { "n", "v", "x" },
    "gb",
    desc = "Toggle block comment",
  },
}

editor.comment.config = true

return { editor.autoclose, editor.surround, editor.comment }
