return {
  "stevearc/oil.nvim",
  lazy = false,
  keys = {
    { "<leader>e", "<cmd>Oil<cr>", desc = "Open Oil (current dir)" },
    { "<leader>E", function() require("oil").open(vim.fn.getcwd()) end, desc = "Open Oil (cwd)" },
  },
  opts = {
    default_file_explorer = true,
    view_options = { show_hidden = true },
    -- これを追加
    buf_options = {
      buflisted = true,   -- snacks pickerが認識しやすくする
    },
  },
}
