return {
  "folke/snacks.nvim",
  event = "VeryLazy",
  ---@type snacks.Config
  opts = {
    bigfile   = { enabled = true },
    quickfile = { enabled = true },
    indent    = { enabled = true },
    dashboard = { enabled = false },
    picker    = { enabled = true },
    explorer  = { enabled = false },
    lazygit   = { enabled = true },
    image     = { enabled = false },
    animate   = { enabled = true },
    zen       = { enabled = true },
    terminal  = { enabled = true },
  },
  keys = {
    { "<leader>sf", function() Snacks.picker.files() end,   desc = "Find Files" },
    { "<leader>sg", function() Snacks.picker.grep() end,    desc = "Grep" },
    { "<leader>se", function() Snacks.explorer() end,       desc = "Explorer" },
    { "<leader>gz", function() Snacks.lazygit() end,        desc = "Lazygit" },
    { "<leader>z",  function() Snacks.zen() end,            desc = "Zen Mode" },
  },
}
