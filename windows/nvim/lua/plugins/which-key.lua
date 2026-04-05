return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    delay = 300,
    icons = { mappings = true },
    spec = {
      { "<leader>s", group = "search" },
      { "<leader>c", group = "code / LSP" },
      { "<leader>g", group = "git" },
      { "<leader>b", group = "buffer" },
      { "<leader>t", group = "test" },
      { "<leader>h", group = "http" },
      { "<leader>x", group = "trouble" },
      { "<leader>d", group = "DAP" },
    },
  },
}
