return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
    },
    keys = {
      { "<leader>tr", function() require("neotest").run.run() end,                        desc = "Run nearest test" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,       desc = "Run test file" },
      { "<leader>ts", function() require("neotest").run.stop() end,                       desc = "Stop test" },
      { "<leader>to", function() require("neotest").output.open({ enter = true }) end,    desc = "Test output" },
      { "<leader>tS", function() require("neotest").summary.toggle() end,                 desc = "Test summary" },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
            runner = "pytest",
          }),
        },
      })
    end,
  },
}
