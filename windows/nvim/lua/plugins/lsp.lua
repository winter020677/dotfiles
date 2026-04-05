return {
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim" },
  { "b0o/SchemaStore.nvim" },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "b0o/SchemaStore.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "ruff", "pyright", "jsonls", "yamlls" },
      })

      local schemastore = require("schemastore")

      vim.lsp.config("ruff", {})
      vim.lsp.config("pyright", {})

      vim.lsp.config("jsonls", {
        settings = {
          json = {
            schemas = schemastore.json.schemas(),
            validate = { enable = true },
          },
        },
      })

      vim.lsp.config("yamlls", {
        settings = {
          yaml = {
            schemaStore = { enable = false, url = "" },
            schemas = schemastore.yaml.schemas(),
          },
        },
      })

      vim.lsp.enable({ "ruff", "pyright", "jsonls", "yamlls" })
    end,
  },
}
