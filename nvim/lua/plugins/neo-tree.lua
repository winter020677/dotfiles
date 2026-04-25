return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" },
  },
  opts = {
    close_if_last_window = true,
    window = {
      position = "right",
    },
    filesystem = {
      hijack_netrw_behavior = "disabled",
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
      },
    },
  },
}
