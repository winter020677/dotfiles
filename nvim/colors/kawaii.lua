-- kawaii.lua  ピンク系かわいいカラースキーム
-- WezTermと同じカラーパレットに合わせた設定

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.g.colors_name = "kawaii"
vim.opt.termguicolors = true
vim.opt.background = "dark"

local c = {
  bg0      = "#160a14",  -- メイン背景 (ダークピンク)
  bg1      = "#1f0f1c",  -- サイドバー・浮き要素
  bg2      = "#2a1528",  -- カーソル行・選択
  bg3      = "#3a1f38",  -- 非アクティブ要素
  bg4      = "#4a2a48",  -- ビジュアル選択
  fg0      = "#ffc8e8",  -- メイン文字 (ピンク)
  fg1      = "#d4a8c8",  -- 薄い文字
  fg2      = "#8a6080",  -- コメント
  pink     = "#ffb3e0",  -- キーワード・カーソル (淡いパステルピンク)
  pink_l   = "#ffd6ee",  -- 明るいピンク
  purple   = "#d8b4f0",  -- 型・クラス (淡パープル)
  purple_l = "#e8c8ff",  -- 関数 (より淡く)
  green    = "#c0e86a",  -- 文字列
  yellow   = "#ffb86c",  -- 定数・数値
  cyan     = "#e0a0d8",  -- 組み込み・特殊 (ピンクライラック)
  red      = "#ff5c8a",  -- エラー
  orange   = "#ff9580",  -- 警告
}

local function hi(name, opts)
  vim.api.nvim_set_hl(0, name, opts)
end

-- 基本
hi("Normal",       { fg = c.fg0 })           -- bg NONE → WezTermの透過が透ける
hi("NormalFloat",  { fg = c.fg0 })           -- フロートも透過
hi("NormalNC",     { fg = c.fg1 })           -- 非アクティブウィンドウも透過
hi("ColorColumn",  { bg = c.bg1 })
hi("Conceal",      { fg = c.fg2 })
hi("Cursor",       { fg = c.bg0, bg = c.pink })
hi("CursorLine",   { bg = c.bg2 })
hi("CursorColumn", { bg = c.bg2 })
hi("CursorLineNr", { fg = c.pink, bold = true })
hi("LineNr",       { fg = c.fg2, bg = "NONE" })
hi("SignColumn",   { fg = c.fg2, bg = "NONE" })
hi("MatchParen",   { fg = c.pink, bold = true, underline = true })
hi("NonText",      { fg = c.bg3 })
hi("Whitespace",   { fg = c.bg3 })
hi("SpecialKey",   { fg = c.bg3 })
hi("Visual",       { bg = c.bg4 })
hi("VisualNOS",    { bg = c.bg4 })

-- 検索
hi("Search",    { fg = c.bg0, bg = c.pink })
hi("IncSearch", { fg = c.bg0, bg = c.yellow })
hi("CurSearch", { fg = c.bg0, bg = c.pink_l })

-- ポップアップ
hi("Pmenu",      { fg = c.fg0, bg = c.bg1 })
hi("PmenuSel",   { fg = c.bg0, bg = c.pink })
hi("PmenuSbar",  { bg = c.bg2 })
hi("PmenuThumb", { bg = c.pink })

-- ステータスライン
hi("StatusLine",   { fg = c.fg0, bg = c.bg1 })
hi("StatusLineNC", { fg = c.fg2, bg = c.bg1 })
hi("WinSeparator", { fg = c.bg3 })

-- タブライン
hi("TabLine",     { fg = c.fg2, bg = c.bg1 })
hi("TabLineSel",  { fg = c.bg0, bg = c.pink, bold = true })
hi("TabLineFill", { bg = c.bg1 })

-- 折り畳み
hi("Folded",     { fg = c.fg2, bg = c.bg2 })
hi("FoldColumn", { fg = c.fg2 })

-- メッセージ
hi("ErrorMsg",   { fg = c.red, bold = true })
hi("WarningMsg", { fg = c.orange })
hi("ModeMsg",    { fg = c.pink, bold = true })
hi("MoreMsg",    { fg = c.green })
hi("Question",   { fg = c.purple_l })

-- diff
hi("DiffAdd",    { bg = "#1a2e10" })
hi("DiffChange", { bg = "#1e1030" })
hi("DiffDelete", { bg = "#2e0d1a" })
hi("DiffText",   { bg = "#3a1a50", bold = true })

-- 診断
hi("DiagnosticError", { fg = c.red })
hi("DiagnosticWarn",  { fg = c.orange })
hi("DiagnosticInfo",  { fg = c.cyan })
hi("DiagnosticHint",  { fg = c.purple_l })
hi("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.orange })

-- 構文ハイライト
hi("Comment",        { fg = c.fg2, italic = true })
hi("Constant",       { fg = c.yellow })
hi("String",         { fg = c.green })
hi("Character",      { fg = c.green })
hi("Number",         { fg = c.yellow })
hi("Float",          { fg = c.yellow })
hi("Boolean",        { fg = c.pink })
hi("Identifier",     { fg = c.fg0 })
hi("Function",       { fg = c.purple_l })
hi("Statement",      { fg = c.pink })
hi("Keyword",        { fg = c.pink, italic = true })
hi("Conditional",    { fg = c.pink, italic = true })
hi("Repeat",         { fg = c.pink, italic = true })
hi("Label",          { fg = c.pink })
hi("Operator",       { fg = c.pink_l })
hi("Exception",      { fg = c.red })
hi("PreProc",        { fg = c.cyan })
hi("Include",        { fg = c.cyan })
hi("Define",         { fg = c.cyan })
hi("Macro",          { fg = c.cyan })
hi("Type",           { fg = c.purple })
hi("StorageClass",   { fg = c.purple })
hi("Structure",      { fg = c.purple })
hi("Typedef",        { fg = c.purple })
hi("Special",        { fg = c.cyan })
hi("SpecialChar",    { fg = c.yellow })
hi("Delimiter",      { fg = c.fg1 })
hi("Underlined",     { underline = true })
hi("Error",          { fg = c.red, bold = true })
hi("Todo",           { fg = c.bg0, bg = c.pink, bold = true })

-- Snacks Dashboard
hi("SnacksDashboardHeader",  { fg = c.pink,     bold = true })
hi("SnacksDashboardFooter",  { fg = c.fg2,      italic = true })
hi("SnacksDashboardTitle",   { fg = c.purple_l, bold = true })
hi("SnacksDashboardDesc",    { fg = c.fg0 })
hi("SnacksDashboardIcon",    { fg = c.pink })
hi("SnacksDashboardKey",     { fg = c.yellow,   bold = true })
hi("SnacksDashboardSpecial", { fg = c.pink_l })
hi("SnacksDashboardFile",    { fg = c.fg0 })
hi("SnacksDashboardDir",     { fg = c.fg2 })

-- MiniStarter
hi("MiniStarterHeader",      { fg = c.pink,     bold = true })
hi("MiniStarterFooter",      { fg = c.fg2,      italic = true })
hi("MiniStarterItem",        { fg = c.fg0 })
hi("MiniStarterItemBullet",  { fg = c.pink })
hi("MiniStarterItemPrefix",  { fg = c.pink_l,   bold = true })
hi("MiniStarterSection",     { fg = c.purple_l, bold = true })
hi("MiniStarterQuery",       { fg = c.pink,     bold = true })

-- Treesitter
hi("@variable",            { fg = c.fg0 })
hi("@variable.builtin",    { fg = c.cyan })
hi("@variable.parameter",  { fg = c.fg0 })
hi("@function",            { fg = c.purple_l })
hi("@function.builtin",    { fg = c.cyan })
hi("@function.call",       { fg = c.purple_l })
hi("@method",              { fg = c.purple_l })
hi("@keyword",             { fg = c.pink, italic = true })
hi("@keyword.return",      { fg = c.pink, italic = true })
hi("@keyword.operator",    { fg = c.pink_l })
hi("@conditional",         { fg = c.pink, italic = true })
hi("@repeat",              { fg = c.pink, italic = true })
hi("@type",                { fg = c.purple })
hi("@type.builtin",        { fg = c.purple })
hi("@string",              { fg = c.green })
hi("@number",              { fg = c.yellow })
hi("@float",               { fg = c.yellow })
hi("@boolean",             { fg = c.pink })
hi("@constant",            { fg = c.yellow })
hi("@constant.builtin",    { fg = c.cyan })
hi("@operator",            { fg = c.pink_l })
hi("@punctuation",         { fg = c.fg1 })
hi("@comment",             { fg = c.fg2, italic = true })
hi("@tag",                 { fg = c.pink })
hi("@tag.attribute",       { fg = c.purple_l })
hi("@tag.delimiter",       { fg = c.fg1 })
