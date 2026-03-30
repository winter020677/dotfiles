return {
  "folke/snacks.nvim",
  priority = 1000,  -- 早めにロード（dashboardとかのため）
  lazy = false,     -- 起動時ロード（おすすめ）
  ---@type snacks.Config
  opts = {
    -- 基本的にデフォルトでOKだけど、Python開発向けに調整例
    bigfile = { enabled = true },          -- 大きいPythonファイル（データ処理スクリプト）でも重くならない
    quickfile = { enabled = true },        -- 素早くファイル開く
    indent = { enabled = true },           -- インデントガイド（Pythonのインデント命！）
    dashboard = { enabled = true },        -- かっこいいスタート画面
    picker = { enabled = true },           -- Snacksの高速picker（Telescope代替）
    explorer = { enabled = false },         -- ファイラー（oil.nvim卒業可能）
    lazygit = { enabled = true },          -- lazygitをfloatで開く（git操作楽）
    image = { enabled = true },            -- markdownなどに画像表示（ドキュメント書くとき便利）
    animate = { enabled = true },          -- スムーズアニメーション
    zen = { enabled = true },              -- zen mode（集中モード）
    terminal = { enabled = true },         -- ターミナル統合
  },
  keys = {
    -- よく使うキー例（好みで変えて）
    { "<leader>sf", function() Snacks.picker.files() end, desc = "Find Files (Snacks)" },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep (Snacks)" },
    { "<leader>se", function() Snacks.explorer() end, desc = "Explorer" },
    { "<leader>gz", function() Snacks.lazygit() end, desc = "Lazygit" },
    { "<leader>z", function() Snacks.zen() end, desc = "Zen Mode" },
  },
}
