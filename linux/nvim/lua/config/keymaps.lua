local map = vim.keymap.set

-- ────────────────────────────────────────────
-- 基本操作
-- ────────────────────────────────────────────

-- ESC で検索ハイライト消去
map("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- jj でインサートモード脱出
map("i", "jj", "<Esc>")

-- ファイル保存
map({ "n", "i" }, "<C-s>", "<cmd>w<cr><Esc>", { desc = "Save file" })

-- 新規行を挿入モードなしで追加
map("n", "<leader>o", "o<Esc>", { desc = "New line below" })
map("n", "<leader>O", "O<Esc>", { desc = "New line above" })

-- 現在行を下に複製
map("n", "<leader>D", "yyp", { desc = "Duplicate line below" })

-- ────────────────────────────────────────────
-- 移動
-- ────────────────────────────────────────────

-- ウィンドウ移動（Ctrl + hjkl）
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- ウィンドウリサイズ（矢印キー）
map("n", "<C-Up>",    "<cmd>resize +2<cr>")
map("n", "<C-Down>",  "<cmd>resize -2<cr>")
map("n", "<C-Left>",  "<cmd>vertical resize -2<cr>")
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

-- 検索結果・スクロールを画面中央に
map("n", "n",     "nzzzv")
map("n", "N",     "Nzzzv")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- ────────────────────────────────────────────
-- 編集
-- ────────────────────────────────────────────

-- 行を上下に移動（Alt + j/k）
map("n", "<A-j>", "<cmd>m .+1<cr>==")
map("n", "<A-k>", "<cmd>m .-2<cr>==")
map("v", "<A-j>", ":m '>+1<cr>gv=gv")
map("v", "<A-k>", ":m '<-2<cr>gv=gv")

-- インデント後もビジュアル選択を維持
map("v", "<", "<gv")
map("v", ">", ">gv")

-- ペースト時にレジスタを汚さない
map("v", "p", '"_dP')

-- ────────────────────────────────────────────
-- ダッシュボード
-- ────────────────────────────────────────────

map("n", "<leader>q", "<cmd>lua require('mini.starter').open()<cr>", { desc = "Open dashboard" })

-- ────────────────────────────────────────────
-- バッファ
-- ────────────────────────────────────────────

map("n", "<S-l>",      "<cmd>bnext<cr>",     { desc = "Next buffer" })
map("n", "<S-h>",      "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>",   { desc = "Delete buffer" })
map("n", "<leader>bo", function()
  local cur = vim.fn.bufnr()
  for _, b in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
    if b.bufnr ~= cur then vim.cmd("bdelete " .. b.bufnr) end
  end
end, { desc = "Delete other buffers" })

-- ────────────────────────────────────────────
-- Snacks picker
-- ────────────────────────────────────────────

map("n", "<leader>sf", function() Snacks.picker.files() end,         { desc = "Find files" })
map("n", "<leader>sg", function() Snacks.picker.grep() end,          { desc = "Grep" })
map("n", "<leader>sb", function() Snacks.picker.buffers() end,       { desc = "Buffers" })
map("n", "<leader>sr", function() Snacks.picker.recent() end,        { desc = "Recent files" })
map("n", "<leader>s/", function() Snacks.picker.grep_buffers() end,  { desc = "Grep open buffers" })
map("n", "<leader>sk", function() Snacks.picker.keymaps() end,       { desc = "Keymaps" })
map("n", "<leader>sd", function() Snacks.picker.diagnostics() end,   { desc = "Diagnostics" })
map("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end,   { desc = "LSP symbols" })

-- ────────────────────────────────────────────
-- 診断ナビゲーション
-- ────────────────────────────────────────────

map("n", "]d", function() vim.diagnostic.goto_next() end, { desc = "Next diagnostic" })
map("n", "[d", function() vim.diagnostic.goto_prev() end, { desc = "Prev diagnostic" })
map("n", "<leader>d", function() vim.diagnostic.open_float() end, { desc = "Show diagnostic" })

-- ────────────────────────────────────────────
-- LSP（アタッチ時に有効化）
-- ────────────────────────────────────────────

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local lmap = function(key, fn, desc)
      map("n", key, fn, { buffer = ev.buf, desc = desc })
    end

    lmap("gd",         vim.lsp.buf.definition,      "Go to definition")
    lmap("gD",         vim.lsp.buf.declaration,     "Go to declaration")
    lmap("gr",         vim.lsp.buf.references,      "References")
    lmap("gi",         vim.lsp.buf.implementation,  "Go to implementation")
    lmap("K",          vim.lsp.buf.hover,           "Hover doc")
    lmap("<leader>cr", vim.lsp.buf.rename,          "Rename symbol")
    lmap("<leader>ca", vim.lsp.buf.code_action,     "Code action")
    lmap("<leader>ct", vim.lsp.buf.type_definition, "Type definition")
  end,
})
