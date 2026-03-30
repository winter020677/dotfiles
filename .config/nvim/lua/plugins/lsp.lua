return {
  -- Mason: ツール自動インストール
  { "williamboman/mason.nvim", config = true },

  -- Mason と lspconfig の橋渡し（自動インストール用）
  { "williamboman/mason-lspconfig.nvim" },

  -- LSP設定（新API: vim.lsp.config + vim.lsp.enable）
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Masonセットアップ
      require("mason").setup()

      -- 自動インストール（ruff と pyright）
      require("mason-lspconfig").setup({
        ensure_installed = { "ruff", "pyright" },
      })

      -- 新APIで設定（nvim-lspconfig のデフォルトconfigsを活用）
      -- ruff（優先: 速いlint/format/imports整理）
      vim.lsp.config('ruff', {
        -- 必要に応じてカスタム（デフォルトでOKなら空でも動く）
        -- settings = { ... },
      })

      vim.lsp.config('pyright', {
        -- pyrightの型チェック強い場合のカスタム例
        -- settings = { python = { analysis = { ... } } },
      })

      -- 自動有効化（ファイルタイプで起動）
      vim.lsp.enable({ "ruff", "pyright" })
    end,
  },
}
