vim.cmd.highlight("clear")
vim.cmd.syntax("reset")

vim.g.colors_name = "moon"

local C = {
  bg = {
    base = "#212431",
    dark = "#14161f",
    bright = "#2a2e41",
  },
  fg = {
    base = "#aab0cf",
    dark = "#7e84a5",
    bright = "#dbdbdb",
  },
  grey = {
    base = "#9da9be",
    dark = "#333c4d",
  },
  red = {
    base = "#e65e5e",
    dark = "#ed8f8f",
  },
  green = {
    base = "#89a389",
    dark = "#a7baa7",
  },
  blue = {
    base = "#7d87bf",
    bright = "#b8bbe0",
  },
  yellow = {
    base = "#d2c57f",
    bright = "#e9dd95",
  },
  orange = {
    base = "#d3b488",
    bright = "#ecc083",
  },
  cyan = {
    base = "#89bcc8",
    dark = "#5ca2b2",
  },
  purple = {
    base = "#a286e4",
    bright = "#bba1f7",
  },
}

local function hex_to_rgb(str)
  str = string.lower(str)

  local hex = "[abcdef0-9][abcdef0-9]"
  local pattern = "^#(" .. hex .. ")(" .. hex .. ")(" .. hex .. ")$"

  assert(
    string.find(str, pattern) ~= nil,
    "hex_to_rgb: invalid hex_str: " .. tostring(str)
  )

  local r, g, b = string.match(str, pattern)

  return { tonumber(r, 16), tonumber(g, 16), tonumber(b, 16) }
end

local function blend(foreground, background, alpha)
  background = hex_to_rgb(background)
  foreground = hex_to_rgb(foreground)

  local function blend_channel(i)
    local ret = (alpha * foreground[i] + ((1 - alpha) * background[i]))

    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format(
    "#%02X%02X%02X",
    blend_channel(1),
    blend_channel(2),
    blend_channel(3)
  )
end

local function darken(hex, amount, bg)
  return blend(hex, bg or C.bg.base, math.abs(amount))
end

local function lighten(hex, amount, fg)
  return blend(hex, fg or C.fg.bright, math.abs(amount))
end

local highlight_groups = {
  -- Editor
  Cursor = { fg = C.bg.dark, bg = C.grey.base },
  CursorColumn = { bg = C.bg.base },
  CurSearch = { fg = C.bg.dark, bg = C.orange.base },

  CursorLine = { bg = C.bg.base },
  CursorLineNr = { fg = C.fg.base },
  CursorLineFold = { link = "FoldColumn" },
  CursorLineSign = { link = "SignColumn" },

  DiffAdd = { fg = C.green.base },
  DiffChange = { fg = C.yellow.base },
  DiffDelete = { fg = C.red.base },
  DiffText = { fg = C.blue.base },

  diffAdded = { link = "DiffAdd" },
  diffChanged = { link = "DiffChange" },
  diffRemoved = { link = "DiffDelete" },

  ColorColumn = { bg = C.bg.base },
  Conceal = { bg = "NONE" },
  Directory = { fg = C.blue.base },
  EndOfBuffer = { fg = C.bg.dark, bg = C.bg.dark },

  TermCursor = { fg = C.bg.dark, bg = C.fg.bright },
  TermCursorNC = { link = "TermCursor" },

  Folded = { fg = C.fg.dark },
  FoldColumn = { fg = C.yellow.base },

  Search = { fg = C.fg.bright, bg = C.bg.bright },
  IncSearch = { fg = C.bg.dark, bg = C.orange.base },

  Substitute = { link = "IncSearch" },
  QuickFixLine = { link = "Search" },
  WildMenu = { link = "IncSearch" },
  MatchParen = { fg = C.cyan.base },

  LineNr = { fg = C.fg.dark },
  LineNrAbove = { link = "LineNr" },
  LineNrBelow = { link = "LineNr" },

  ModeMsg = { fg = C.fg.bright },
  MoreMsg = { fg = C.blue.base },
  WarningMsg = { fg = C.red.base },

  MsgArea = { link = "Normal" },
  MsgSeparator = { link = "StatusLine" },

  Normal = { fg = C.fg.bright, bg = C.bg.dark },
  NormalNC = { link = "Normal" },
  NormalFloat = { fg = C.fg.bright, bg = darken(C.bg.dark, 0.5) },

  FloatBorder = { fg = C.fg.dark, bg = darken(C.bg.dark, 0.5) },
  FloatTitle = { fg = C.fg.bright },

  Pmenu = { fg = C.fg.base, bg = darken(C.bg.dark, 0.5) },
  PmenuSel = { fg = C.fg.bright, bg = darken(C.bg.bright, 0.8) },
  PmenuSbar = { bg = darken(C.bg.dark, 0.5) },
  PmenuThumb = { bg = lighten(C.bg.bright, 0.8) },

  ErrorMsg = { fg = C.red.base },
  NvimInternalError = { link = "ErrorMsg" },

  Title = { fg = C.cyan.base },
  SignColumn = { fg = C.yellow.base },
  Question = { fg = C.yellow.base },
  SpecialKey = { bg = C.bg.bright },
  NonText = { fg = C.fg.dark },
  Whitespace = { link = "NonText" },

  SpellLocal = { sp = C.blue.base, undercurl = true },
  SpellCap = { sp = C.yellow.base, undercurl = true },
  SpellRare = { sp = C.orange.base, undercurl = true },
  SpellBad = { sp = C.red.base, undercurl = true },

  StatusLine = { fg = C.fg.bright, bg = darken(C.bg.dark, 0.5) },
  StatusLineNC = { fg = C.fg.dark, bg = C.bg.dark },

  TabLine = { fg = C.fg.bright, bg = C.bg.dark },
  TabLineFill = { fg = C.fg.bright, bg = C.bg.dark },
  TabLineSel = { fg = C.fg.bright, bg = C.bg.base },

  Visual = { bg = C.grey.dark },
  VisualNOS = { link = "Visual" },

  WinSeparator = { fg = C.bg.bright },

  helpHeader = { fg = C.cyan.base },
  helpSectionDelim = { fg = C.fg.base },

  healthSuccess = { fg = C.green.base },
  healthHelp = { fg = C.blue.base },
  healthWarning = { fg = C.yellow.base },
  healthError = { fg = C.red.base },

  -- Syntax
  Constant = { fg = C.cyan.base },
  String = { fg = C.green.base },
  Character = { fg = C.green.base },
  Number = { fg = C.blue.bright },
  Boolean = { fg = C.blue.bright },
  Float = { fg = C.orange.base },

  Identifier = { fg = C.orange.bright },
  Function = { fg = C.purple.bright },

  Statement = { fg = C.blue.bright },
  Conditional = { fg = C.blue.base },
  Repeat = { fg = C.blue.base },
  Label = { fg = C.blue.base },
  Operator = { fg = C.fg.dark },
  Keyword = { fg = C.blue.base },
  Exception = { fg = C.blue.base },

  PreProc = { fg = C.yellow.base },
  Include = { fg = C.blue.bright },
  Define = { fg = C.purple.base },
  Macro = { fg = C.purple.base },
  PreCondit = { link = "PreProc" },

  Type = { fg = C.orange.base },
  StorageClass = { fg = C.yellow.base },
  Structure = { fg = C.yellow.base },
  Typedef = { link = "Type" },

  Special = { fg = C.blue.base },
  SpecialChar = { link = "Special" },
  Tag = { fg = C.orange.base },
  Delimiter = { fg = C.fg.base },
  Debug = { fg = C.cyan.dark },

  Comment = { fg = C.fg.dark },
  SpecialComment = { fg = C.fg.dark },

  Underlined = { underline = true },
  Todo = { fg = C.blue.base },
  Error = { fg = C.red.base },
  Ignore = { fg = C.fg.dark },

  -- LSP
  LspReferenceText = { link = "Search" },
  LspReferenceRead = { link = "Search" },
  LspReferenceWrite = { link = "Search" },
  LspSignatureActiveParameter = { link = "Search" },

  ["@lsp.type.comment"] = {},
  ["@lsp.type.class"] = {},
  ["@lsp.type.decorator"] = {},
  ["@lsp.type.enum"] = { link = "Type" },
  ["@lsp.type.enumMember"] = {},
  ["@lsp.type.function"] = { link = "Function" },
  ["@lsp.type.interface"] = { link = "Type" },
  ["@lsp.type.keyword"] = { link = "Keyword" },
  ["@lsp.type.macro"] = { link = "Macro" },
  ["@lsp.type.method"] = { link = "Function" },
  ["@lsp.type.namespace"] = {},
  ["@lsp.type.parameter"] = {},
  ["@lsp.type.property"] = {},
  ["@lsp.type.struct"] = {},
  ["@lsp.type.type"] = { link = "Type" },
  ["@lsp.type.typeParameter"] = {},
  ["@lsp.type.variable"] = {},

  -- Diagnostic
  DiagnosticOk = { fg = C.green.dark, bg = darken(C.green.dark, 0.1) },
  DiagnosticHint = { fg = C.green.base, bg = darken(C.green.base, 0.1) },
  DiagnosticInfo = { fg = C.blue.bright, bg = darken(C.blue.bright, 0.1) },
  DiagnosticWarn = { fg = C.orange.bright, bg = darken(C.orange.bright, 0.1) },
  DiagnosticError = { fg = C.red.base, bg = darken(C.red.base, 0.1) },

  DiagnosticUnderlineOk = { sp = C.green.dark, undercurl = true },
  DiagnosticUnderlineHint = { sp = C.green.base, undercurl = true },
  DiagnosticUnderlineInfo = { sp = C.blue.bright, undercurl = true },
  DiagnosticUnderlineWarn = { sp = C.orange.bright, undercurl = true },
  DiagnosticUnderlineError = { sp = C.red.base, undercurl = true },

  DiagnosticVirtualTextOk = {
    fg = C.green.dark,
    bg = darken(C.green.dark, 0.1),
  },
  DiagnosticVirtualTextHint = {
    fg = C.green.base,
    bg = darken(C.green.base, 0.1),
  },
  DiagnosticVirtualTextInfo = {
    fg = C.blue.bright,
    bg = darken(C.blue.bright, 0.1),
  },
  DiagnosticVirtualTextWarn = {
    fg = C.orange.bright,
    bg = darken(C.orange.bright, 0.1),
  },
  DiagnosticVirtualTextError = { fg = C.red.base, bg = darken(C.red.base, 0.1) },

  DiagnosticFloatingOk = { fg = C.green.dark },
  DiagnosticFloatingHint = { fg = C.green.base },
  DiagnosticFloatingInfo = { fg = C.blue.bright },
  DiagnosticFloatingWarn = { fg = C.orange.bright },
  DiagnosticFloatingError = { fg = C.red.base },

  DiagnosticSignOk = { fg = C.green.dark },
  DiagnosticSignHint = { fg = C.green.base },
  DiagnosticSignInfo = { fg = C.blue.bright },
  DiagnosticSignWarn = { fg = C.orange.bright },
  DiagnosticSignError = { fg = C.red.base },

  DiagnosticDeprecated = { strikethrough = true },
  DiagnosticUnnecessary = { fg = C.fg.dark },

  -- Treesitter
  ["@variable"] = { fg = C.fg.bright },
  ["@variable.builtin"] = { fg = C.cyan.base },
  ["@variable.parameter"] = { link = "@variable" },
  ["@variable.member"] = { fg = C.fg.bright },

  ["@constant"] = { link = "Constant" },
  ["@constant.builtin"] = { fg = C.cyan.base },
  ["@constant.macro"] = { fg = C.purple.base },

  ["@module"] = { fg = C.fg.bright },
  ["@module.builtin"] = { fg = C.cyan.base },

  ["@label"] = { link = "Label" },
  ["@label.markdown"] = { fg = C.cyan.dark },

  ["@string"] = { link = "String" },
  ["@string.regexp"] = { fg = C.cyan.dark },
  ["@string.escape"] = { fg = C.green.dark },
  ["@string.special"] = { link = "String" },
  ["@string.special.symbol"] = { link = "Identifier" },
  ["@string.special.url"] = { fg = C.green.base },

  ["@character"] = { link = "Character" },
  ["@character.special"] = { link = "SpecialChar" },

  ["@boolean"] = { link = "Boolean" },

  ["@number"] = { link = "Number" },
  ["@number.float"] = { link = "Float" },

  ["@type"] = { link = "Type" },
  ["@type.builtin"] = { fg = C.cyan.base },
  ["@type.definition"] = { link = "Typedef" },
  ["@type.qualifier"] = { fg = C.blue.base },

  ["@property"] = { fg = C.blue.bright },

  ["@function"] = { link = "Function" },
  ["@function.builtin"] = { link = "Function" },
  ["@function.call"] = { link = "Function" },
  ["@function.macro"] = { link = "Function" },

  ["@function.method"] = { link = "Function" },
  ["@function.method.call"] = { link = "Function" },

  ["@constructor"] = { link = "Function" },
  ["@constructor.lua"] = { fg = C.fg.dark },
  ["@operator"] = { link = "Operator" },

  ["@keyword"] = { link = "Keyword" },
  ["@keyword.coroutine"] = { link = "@keyword" },
  ["@keyword.function"] = { link = "@keyword" },
  ["@keyword.operator"] = { link = "@keyword" },
  ["@keyword.import"] = { link = "@keyword" },
  ["@keyword.storage"] = { link = "@keyword" },
  ["@keyword.repeat"] = { link = "@keyword" },
  ["@keyword.return"] = { link = "@keyword" },
  ["@keyword.debug"] = { link = "@keyword" },
  ["@keyword.exception"] = { link = "@keyword" },

  ["@keyword.conditional"] = { link = "@keyword" },
  ["@keyword.conditional.ternary"] = { link = "@keyword" },

  ["@keyword.directive"] = { fg = C.yellow.base },
  ["@keyword.directive.define"] = { fg = C.purple.base },

  ["@punctuation.delimiter"] = { link = "Delimiter" },
  ["@punctuation.bracket"] = { fg = C.fg.dark },
  ["@punctuation.special"] = { fg = C.cyan.base },

  ["@comment"] = { link = "Comment" },
  ["@comment.documentation"] = { link = "@comment" },

  ["@comment.todo"] = { fg = C.bg.dark, bg = C.cyan.base },
  ["@comment.hint"] = { fg = C.bg.dark, bg = C.green.base },
  ["@comment.info"] = { fg = C.bg.dark, bg = C.purple.base },
  ["@comment.note"] = { fg = C.bg.dark, bg = C.blue.base },
  ["@comment.warning"] = { fg = C.bg.dark, bg = C.orange.base },
  ["@comment.error"] = { fg = C.bg.dark, bg = C.red.base },

  ["@markup.strikethrough"] = { strikethrough = true },
  ["@markup.underline"] = { underline = true },

  ["@markup.heading"] = { link = "Title" },
  ["@markup.quote"] = { fg = C.fg.dark },
  ["@markup.math"] = { link = "Special" },
  ["@markup.environment"] = { link = "Macro" },

  ["@markup.link"] = { fg = C.cyan.dark },
  ["@markup.link.label"] = { fg = C.purple.bright },
  ["@markup.link.url"] = { fg = C.green.base },

  ["@markup.raw"] = { fg = C.fg.dark },
  ["@markup.raw.block"] = { link = "@markup.raw" },
  ["@markup.raw.markdown_inline"] = { link = "@markup.raw.block" },

  ["@markup.list"] = { fg = C.cyan.base },
  ["@markup.list.checked"] = { fg = C.cyan.base, bg = C.bg.base },
  ["@markup.list.unchecked"] = { fg = C.fg.bright },

  ["@diff.plus"] = { link = "DiffAdd" },
  ["@diff.minus"] = { link = "DiffDelete" },
  ["@diff.delta"] = { link = "DiffChange" },

  ["@tag"] = { link = "Tag" },
  ["@tag.attribute"] = { fg = C.blue.bright },
  ["@tag.delimiter"] = { link = "Delimiter" },

  -- nvim-cmp
  CmpItemAbbr = { fg = C.fg.base },
  CmpItemAbbrMatch = { fg = C.fg.bright },
  CmpItemAbbrMatchFuzzy = { fg = C.cyan.base },
  CmpItemAbbrDeprecated = { fg = C.fg.base, strikethrough = true },

  CmpItemKind = { fg = C.cyan.base },
  CmpItemKindText = { fg = C.fg.bright },
  CmpItemKindMethod = { link = "Function" },
  CmpItemKindFunction = { link = "Function" },
  CmpItemKindConstructor = { link = "Function" },
  CmpItemKindField = { fg = C.blue.bright },
  CmpItemKindVariable = { link = "Identifier" },
  CmpItemKindClass = { link = "StorageClass" },
  CmpItemKindInterface = { link = "Type" },
  CmpItemKindModule = { fg = C.cyan.base },
  CmpItemKindProperty = { fg = C.blue.bright },
  CmpItemKindUnit = { fg = C.orange.base },
  CmpItemKindValue = { fg = C.fg.base },
  CmpItemKindEnum = { fg = C.cyan.dark },
  CmpItemKindKeyword = { link = "Keyword" },
  CmpItemKindSnippet = { link = "String" },
  CmpItemKindColor = { fg = C.yellow.base },
  CmpItemKindFile = { fg = C.grey.base },
  CmpItemKindReference = { fg = C.orange.base },
  CmpItemKindFolder = { fg = C.blue.base },
  CmpItemKindEnumMember = { fg = C.fg.base },
  CmpItemKindConstant = { fg = C.cyan.base },
  CmpItemKindStruct = { link = "Type" },
  CmpItemKindEvent = { fg = C.purple.base },
  CmpItemKindOperator = { link = "Operator" },
  CmpItemKindTypeParameter = { link = "Type" },

  CmpItemMenu = { fg = C.fg.base },

  -- gitsigns
  GitSignsAdd = { fg = C.green.dark },
  GitSignsChange = { fg = C.orange.bright },
  GitSignsDelete = { fg = C.red.base },
  GitSignsTopDelete = { fg = C.red.base },
  GitSignsChangeDelete = { fg = C.yellow.bright },
}

local terminal_colors = {
  terminal_color_0 = C.bg.dark,
  terminal_color_8 = C.bg.bright,

  terminal_color_1 = C.red.base,
  terminal_color_9 = C.red.base,

  terminal_color_2 = C.green.base,
  terminal_color_10 = C.green.base,

  terminal_color_3 = C.yellow.base,
  terminal_color_11 = C.yellow.bright,

  terminal_color_4 = C.blue.base,
  terminal_color_12 = C.blue.bright,

  terminal_color_5 = C.purple.base,
  terminal_color_13 = C.purple.bright,

  terminal_color_6 = C.cyan.base,
  terminal_color_14 = C.cyan.base,

  terminal_color_7 = C.fg.base,
  terminal_color_15 = C.fg.bright,

  terminal_color_foreground = C.fg.bright,
  terminal_color_background = C.bg.dark,
}

for group, styles in pairs(highlight_groups) do
  vim.api.nvim_set_hl(0, group, styles)
end

for terminal, color in pairs(terminal_colors) do
  vim.g[terminal] = color
end
