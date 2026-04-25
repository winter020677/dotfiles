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
        ensure_installed = { "ruff", "pyright", "ts_ls" },
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config('ruff', {
        capabilities = capabilities,
      })

      vim.lsp.config('pyright', {
        capabilities = capabilities,
      })

      vim.lsp.config('ts_ls', {
        capabilities = capabilities,
      })

      -- 自動有効化（ファイルタイプで起動）
      vim.lsp.enable({ "ruff", "pyright", "ts_ls" })
    end,
  },
}
