return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.config",  -- ← これを 'config' に変更！（configs → config）
  config = function()
    require("nvim-treesitter.config").setup({  -- ← require も config に変更
      ensure_installed = { "python", "lua", "vim", "vimdoc", "query" },
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = { enable = true },
    })
  end,
}
