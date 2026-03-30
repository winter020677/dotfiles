return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-dap-python",
    -- ↓ これを追加！（venv-selector が Telescope を使うため必須）
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  },
  lazy = false,
  config = function()
    require("venv-selector").setup({
      search_workspace = true,
      search_dotvenv = true,
      parents = 1,
      pyenv_path = vim.fn.expand("~/.pyenv"),
      lspconfig = true,
      dap_enabled = true,
    })

    vim.keymap.set("n", "<leader>cv", "<cmd>VenvSelect<cr>", { desc = "Select VirtualEnv" })
  end,
}
