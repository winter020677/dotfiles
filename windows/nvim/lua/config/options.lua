local o = vim.opt

-- 行番号
o.number         = true
o.relativenumber = false

-- インデント（スペース2つ）
o.expandtab  = true
o.shiftwidth = 2
o.tabstop    = 2
o.smartindent = true

-- 検索
o.ignorecase = true   -- 小文字で検索時は大文字小文字無視
o.smartcase  = true   -- 大文字が含まれたら区別する
o.hlsearch   = true

-- スクロール余白（常に上下8行見える）
o.scrolloff     = 8
o.sidescrolloff = 8

-- ウィンドウ分割方向
o.splitright = true
o.splitbelow = true

-- クリップボードをシステムと共有
o.clipboard = "unnamedplus"

-- アンドゥ履歴を永続化
o.undofile = true

-- 常にサインカラム表示（LSP診断でガタつかない）
o.signcolumn = "yes"

-- 更新間隔を短く（LSP診断・gitサインが早く出る）
o.updatetime  = 250
o.timeoutlen  = 300

-- 折り返しなし
o.wrap = false

-- 補完オプション
o.completeopt = "menu,menuone,noselect"

-- 不可視文字の表示
o.list      = true
o.listchars = { tab = "→ ", trail = "·", nbsp = "␣" }

-- カーソル行ハイライト（kawaii.lua の CursorLine が効く）
o.cursorline = true
