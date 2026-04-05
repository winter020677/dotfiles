return {
  "mistweaverco/kulala.nvim",
  ft = "http",
  opts = {
    default_view = "body",
    default_env = "dev",
  },
  keys = {
    { "<leader>hr", function() require("kulala").run() end,       ft = "http", desc = "Run request" },
    { "<leader>ha", function() require("kulala").run_all() end,   ft = "http", desc = "Run all requests" },
    { "<leader>hn", function() require("kulala").jump_next() end, ft = "http", desc = "Next request" },
    { "<leader>hp", function() require("kulala").jump_prev() end, ft = "http", desc = "Prev request" },
  },
}
