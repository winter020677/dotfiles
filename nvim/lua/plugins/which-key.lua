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
    },
  },
}
