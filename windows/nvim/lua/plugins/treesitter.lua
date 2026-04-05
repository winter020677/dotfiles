return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  main = "nvim-treesitter.config",
  config = function()
    require("nvim-treesitter.config").setup({
      ensure_installed = { "python", "lua", "vim", "vimdoc", "query", "json", "yaml", "toml", "html", "markdown", "markdown_inline" },
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = { enable = true },
    })
  end,
}
