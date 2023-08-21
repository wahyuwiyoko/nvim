local setup, autopairs = pcall(require, "nvim-autopairs")

if not setup then
  return
end

autopairs.setup({
  check_ts = true,
  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = [=[[%'%"%>%]%)%}%,]]=],
    offset = 0,
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    manual_position = true,
    highlight = "Search",
    highlight_grey = "Comment"
  }
})
