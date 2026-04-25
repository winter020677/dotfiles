return {
  -- フォーマッター（保存時に自動整形）
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          python = { "ruff_format", "ruff_organize_imports" },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          javascript = { "prettier" },
          javascriptreact = { "prettier" },
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_fallback = true,
        },
      })

      -- 手動整形コマンド（<leader>cf で呼べるように）
      vim.keymap.set({ "n", "v" }, "<leader>cf", function()
        require("conform").format({ async = true, lsp_fallback = true })
      end, { desc = "Format code" })
    end,
  },

  -- リンタ（非同期で診断）
  {
    "mfussenegger/nvim-lint",
    event = { "BufWritePost", "BufReadPost" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        python = { "ruff" },  -- ruff で lint（flake8/pyflakesなど全部カバー）
        -- 追加で "mypy" も入れると型チェック強化（mypy を mason でインストール）
      }

      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
        callback = function()
          lint.try_lint()
        end,
      })

      -- 手動lint（<leader>cl で）
      vim.keymap.set("n", "<leader>cl", function()
        lint.try_lint()
      end, { desc = "Lint code" })
    end,
  },

  -- mason で ruff / mypy を確実にインストール（オプション）
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "ruff", "mypy", "prettier" },
    },
  },
}
