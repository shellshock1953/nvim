-- Data-format tooling: db client, csv, log highlighting, base64
return {
  -- Database client (postgres/mysql/sqlite for infra DBs)
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui"
      vim.g.db_ui_execute_on_save = 0
    end,
    keys = {
      { "<leader>D", "<cmd>DBUIToggle<cr>", desc = "Database UI" },
    },
  },

  -- CSV/TSV
  {
    "chrisbra/csv.vim",
    ft = { "csv", "tsv" },
    init = function()
      vim.g.csv_highlight_column = "y"
      vim.g.csv_strict_columns = 1
    end,
  },

  -- Log file highlighting
  { "mtdl9/vim-log-highlighting", ft = { "log" } },

  -- Base64 encode/decode
  {
    "deponian/nvim-base64",
    cmd = { "Base64Encode", "Base64Decode" },
    config = true,
    keys = {
      { "<leader>xe", "<cmd>Base64Encode<cr>", mode = { "n", "v" }, desc = "Base64 encode" },
      { "<leader>xd", "<cmd>Base64Decode<cr>", mode = { "n", "v" }, desc = "Base64 decode" },
    },
  },
}
