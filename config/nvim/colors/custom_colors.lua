local colors = {
  bg = "#1d1825",
  fg = "#c4b9a6",
  black = "#1d1825",
  red = "#c25c73",
  green = "#51764c",
  yellow = "#b7a268",
  blue = "#4d5b68",
  magenta = "#89758a",
  cyan = "#566b6c",
  white = "c4b9a6",
  bright_black = "#35303d",
  bright_red = "#bf7787",
  bright_green = "#92b25a",
  bright_yellow = "#f5dd90",
  bright_blue = "#84b3c1",
  bright_magenta = "#ac72ab",
  bright_cyan = "#86898a",
  bright_white = "e3dbcf",
}

vim.cmd("highlight clear")
vim.cmd("set background=dark")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "custom_theme"

local function hl(group, fg, bg, style)
  local command = string.format("highlight %s guifg=%s guibg=%s gui=%s", group, fg or "NONE", bg or "NONE", style or "NONE")
  vim.cmd(command)
end

-- General editor UI
hl("Normal", colors.fg, colors.bg)
hl("CursorLine", nil, colors.black)
hl("CursorColumn", nil, colors.black)
hl("LineNr", colors.yellow)
hl("CursorLineNr", colors.bright_white, nil, "bold")
hl("Visual", nil, colors.bright_black)
hl("Search", colors.bg, colors.bright_yellow)
hl("IncSearch", colors.bg, colors.yellow, "bold")

-- Syntax highlighting
hl("Comment", colors.green)
hl("Keyword", colors.yellow)
hl("Identifier", colors.cyan)
hl("Function", colors.cyan)
hl("String", colors.red)
hl("Type", colors.blue)
hl("Constant", colors.magenta)
hl("Operator", colors.red)
hl("Error", colors.bright_red, nil, "bold")
hl("Todo", colors.bright_yellow, nil, "bold")
hl("Statement", colors.yellow)
hl("Operator", colors.cyan)
hl("PreProc", colors.bright_blue)


-- Status line
hl("StatusLine", colors.bg, colors.fg)
hl("StatusLineNC", colors.bright_black, colors.bg)
hl("VertSplit", colors.bright_black, colors.bg)

-- Diagnostics
hl("DiagnosticError", colors.red)
hl("DiagnosticWarn", colors.yellow)
hl("DiagnosticInfo", colors.blue)
hl("DiagnosticHint", colors.cyan)

-- Treesitter highlights
hl("@variable", colors.fg)
hl("@function", colors.blue)
hl("@keyword", colors.yellow)
hl("@string", colors.red)
hl("@type", colors.green)

return colors

