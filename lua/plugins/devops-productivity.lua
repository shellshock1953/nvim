return {
  -- HTTP file syntax highlighting (simple alternative)
  {
    "NTBBloodbath/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = "http",
    config = function()
      require("rest-nvim").setup({
        result_split_horizontal = false,
        result_split_in_place = false,
        skip_ssl_verification = false,
        encode_url = true,
      })
    end,
    keys = {
      { "<leader>ar", "<Plug>RestNvim", desc = "Execute API request", ft = "http" },
    },
  },
  
  -- Docker integration
  {
    "dgrbrady/nvim-docker",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    cmd = { "Docker", "DockerContainers", "DockerImages", "DockerNetworks", "DockerVolumes" },
    keys = {
      { "<leader>d", "", desc = "Docker", mode = { "n", "v" } },
      { "<leader>dc", "<cmd>DockerContainers<cr>", desc = "Docker containers" },
      { "<leader>di", "<cmd>DockerImages<cr>", desc = "Docker images" },
      { "<leader>dn", "<cmd>DockerNetworks<cr>", desc = "Docker networks" },
      { "<leader>dv", "<cmd>DockerVolumes<cr>", desc = "Docker volumes" },
    },
    opts = {
      popup = {
        width = "90%",
        height = "90%",
        border = "rounded",
      },
    },
  },
  
  -- Log file syntax highlighting
  {
    "mtdl9/vim-log-highlighting",
    ft = { "log" },
  },
  
  -- CSV/TSV viewer for data files
  {
    "chrisbra/csv.vim",
    ft = { "csv", "tsv" },
    config = function()
      vim.g.csv_highlight_column = 'y'
      vim.g.csv_strict_columns = 1
    end,
  },
  
  -- Database client for infrastructure DBs
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/db_ui"
      vim.g.db_ui_execute_on_save = 0
    end,
    keys = {
      { "<leader>D", "<cmd>DBUIToggle<cr>", desc = "Database UI" },
    },
  },
  
  -- Task runner for build/deploy scripts
  {
    "stevearc/overseer.nvim",
    cmd = { "OverseerRun", "OverseerToggle", "OverseerInfo" },
    opts = {
      strategy = "toggleterm",
      templates = { "builtin" },
      task_list = {
        direction = "bottom",
        min_height = 15,
        max_height = 25,
      },
    },
    keys = {
      { "<leader>rn", "<cmd>OverseerRun<cr>", desc = "Run task" },
      { "<leader>rt", "<cmd>OverseerToggle<cr>", desc = "Task list" },
      { "<leader>ri", "<cmd>OverseerInfo<cr>", desc = "Task info" },
    },
  },
  
  -- JSON/YAML path viewer
  {
    "mogelbrod/vim-jsonpath",
    ft = { "json", "yaml", "yml" },
    config = function()
      vim.g.jsonpath_register = "+"
    end,
  },
  
  -- Base64 encode/decode
  {
    "deponian/nvim-base64",
    cmd = { "Base64Encode", "Base64Decode" },
    config = true,
    keys = {
      { "<leader>xe", "<cmd>Base64Encode<cr>", desc = "Base64 encode", mode = { "n", "v" } },
      { "<leader>xd", "<cmd>Base64Decode<cr>", desc = "Base64 decode", mode = { "n", "v" } },
    },
  },
}