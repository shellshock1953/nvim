-- Productivity plugins for DevOps workflow optimization
return {
  -- Environment variable management
  {
    "ellisonleao/dotenv.nvim",
    config = true,
    ft = { "sh", "bash", "zsh", "env" },
  },

  -- Advanced .env file support with sophisticated features
  {
    "philosofonusus/ecolog.nvim",
    keys = {
      { "<leader>ce", "<cmd>EcologGoto<cr>", desc = "Goto .env" },
      { "<leader>cs", "<cmd>EcologSelect<cr>", desc = "Select .env" },
      { "<leader>cp", "<cmd>EcologPeek<cr>", desc = "Peek .env" },
    },
    lazy = false,
    opts = {
      integrations = {
        lsp = true,
        nvim_cmp = true,
      },
      path = vim.fn.getcwd(),
      preferred_environment = "local",
    },
  },

  -- Time tracking for coding sessions
  {
    "ptdewey/pendulum-nvim",
    config = function()
      require("pendulum").setup({
        log_file = vim.fn.expand("~/.local/share/nvim/pendulum.log"),
        timeout_len = 5,
        timer_len = 45,
        gen_reports = true,
      })
    end,
    cmd = { "PendulumStart", "PendulumStop", "PendulumToggle", "PendulumReport" },
    keys = {
      { "<leader>Tt", "<cmd>PendulumToggle<cr>", desc = "Toggle time tracking" },
      { "<leader>Tr", "<cmd>PendulumReport<cr>", desc = "Time report" },
    },
  },

  -- Buffer management optimized for DevOps file juggling
  {
    "EL-MASTOR/bufferlist.nvim",
    lazy = false,
    keys = {
      { "<leader>bb", "<cmd>BufferList<cr>", desc = "Buffer List" },
    },
    opts = {
      keymap = {
        close_buf_prefix = "c",
        force_close_buf_prefix = "f",
        save_buffer = "s",
        multi_close_buf = "m",
        close_all_buffers_right = "R",
        close_all_buffers_left = "L",
        close_all_buffers_except_current = "X",
        preview_buffer = "p",
      },
    },
  },

  -- YAML folding for large Kubernetes manifests
  {
    "pedrohdz/vim-yaml-folds",
    ft = { "yaml", "yml" },
    config = function()
      vim.g.yaml_fold_override_foldtext = 1
    end,
  },

  -- Advanced JSON/YAML path navigation
  {
    "mogelbrod/vim-jsonpath",
    ft = { "json", "yaml", "yml" },
    config = function()
      vim.g.jsonpath_register = "+"
    end,
    keys = {
      { "<leader>jp", "<cmd>JsonPath<cr>", desc = "Show JSON path", ft = { "json", "yaml", "yml" } },
    },
  },

  -- Enhanced terminal for DevOps commands
  {
    "akinsho/toggleterm.nvim",
    opts = function(_, opts)
      -- Add DevOps-specific terminal configurations
      local Terminal = require("toggleterm.terminal").Terminal
      
      -- K9s terminal
      local k9s = Terminal:new({
        cmd = "k9s",
        hidden = true,
        direction = "float",
        close_on_exit = true,
        float_opts = {
          border = "curved",
          width = function() return math.floor(vim.o.columns * 0.9) end,
          height = function() return math.floor(vim.o.lines * 0.9) end,
        },
      })
      
      -- LazyDocker terminal
      local lazydocker = Terminal:new({
        cmd = "lazydocker",
        hidden = true,
        direction = "float",
        close_on_exit = true,
        float_opts = {
          border = "curved",
          width = function() return math.floor(vim.o.columns * 0.9) end,
          height = function() return math.floor(vim.o.lines * 0.9) end,
        },
      })
      
      -- Terraform plan terminal
      local tf_plan = Terminal:new({
        cmd = "terraform plan",
        hidden = true,
        direction = "horizontal",
        close_on_exit = false,
      })
      
      -- Add keymaps
      vim.keymap.set("n", "<leader>tk", function() k9s:toggle() end, { desc = "K9s" })
      vim.keymap.set("n", "<leader>tl", function() lazydocker:toggle() end, { desc = "LazyDocker" })
      vim.keymap.set("n", "<leader>ttp", function() tf_plan:toggle() end, { desc = "Terraform Plan" })
      
      return opts
    end,
  },

}
