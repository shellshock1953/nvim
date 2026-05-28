-- Productivity: task runner, time tracking
return {
  -- Task runner for build/deploy
  {
    "stevearc/overseer.nvim",
    cmd = { "OverseerRun", "OverseerToggle", "OverseerInfo" },
    opts = {
      strategy = "toggleterm",
      templates = { "builtin" },
      task_list = { direction = "bottom", min_height = 15, max_height = 25 },
    },
    keys = {
      { "<leader>rn", "<cmd>OverseerRun<cr>",    desc = "Run task" },
      { "<leader>rt", "<cmd>OverseerToggle<cr>", desc = "Task list" },
      { "<leader>ri", "<cmd>OverseerInfo<cr>",   desc = "Task info" },
    },
  },

  -- Time tracking
  {
    "ptdewey/pendulum-nvim",
    cmd = { "PendulumStart", "PendulumStop", "PendulumToggle", "PendulumReport" },
    keys = {
      { "<leader>Tt", "<cmd>PendulumToggle<cr>", desc = "Toggle time tracking" },
      { "<leader>Tr", "<cmd>PendulumReport<cr>", desc = "Time report" },
    },
    opts = {
      log_file = vim.fn.expand("~/.local/share/nvim/pendulum.log"),
      timeout_len = 5,
      timer_len = 45,
      gen_reports = true,
    },
  },
}
