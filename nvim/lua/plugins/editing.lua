return {
  -- 括弧・引用符の自動閉じ
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = { check_ts = true },  -- Treesitter で文脈判断
  },

  -- テキストの囲み操作（ys/ds/cs）
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
  },

  -- コメントアウト（gcc / gc + motion）
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- TODO / FIXME / HACK などをハイライト
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = true },
    keys = {
      { "<leader>st", "<cmd>TodoPicker<cr>", desc = "Todo list" },
    },
  },

  -- Git サイン（追加・変更・削除を左端に表示）＋ hunk 操作
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
      signs = {
        add          = { text = "▎" },
        change       = { text = "▎" },
        delete       = { text = "" },
        topdelete    = { text = "" },
        changedelete = { text = "▎" },
      },
    },
    keys = {
      { "]h", function() require("gitsigns").next_hunk() end, desc = "Next hunk" },
      { "[h", function() require("gitsigns").prev_hunk() end, desc = "Prev hunk" },
      { "<leader>gp", function() require("gitsigns").preview_hunk() end, desc = "Preview hunk" },
      { "<leader>gr", function() require("gitsigns").reset_hunk() end,   desc = "Reset hunk" },
      { "<leader>gb", function() require("gitsigns").blame_line() end,   desc = "Blame line" },
    },
  },

  -- ステータスライン
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = {
          normal   = { a = { fg = "#160a14", bg = "#ffb3e0", gui = "bold" }, b = { fg = "#ffc8e8", bg = "#1f0f1c" }, c = { fg = "#fce8f8", bg = "#110d16" } },
          insert   = { a = { fg = "#160a14", bg = "#ffd6ee", gui = "bold" }, b = { fg = "#ffc8e8", bg = "#1f0f1c" }, c = { fg = "#fce8f8", bg = "#110d16" } },
          visual   = { a = { fg = "#160a14", bg = "#d8b4f0", gui = "bold" }, b = { fg = "#ffc8e8", bg = "#1f0f1c" }, c = { fg = "#fce8f8", bg = "#110d16" } },
          replace  = { a = { fg = "#160a14", bg = "#ff5c8a", gui = "bold" }, b = { fg = "#ffc8e8", bg = "#1f0f1c" }, c = { fg = "#fce8f8", bg = "#110d16" } },
          command  = { a = { fg = "#160a14", bg = "#ffb86c", gui = "bold" }, b = { fg = "#ffc8e8", bg = "#1f0f1c" }, c = { fg = "#fce8f8", bg = "#110d16" } },
          inactive = { a = { fg = "#8a6080", bg = "#1f0f1c" },               b = { fg = "#8a6080", bg = "#1f0f1c" }, c = { fg = "#8a6080", bg = "#110d16" } },
        },
        component_separators = { left = "", right = "" },
        section_separators   = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "diagnostics", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },
}
