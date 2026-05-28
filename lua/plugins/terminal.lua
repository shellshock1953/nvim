return {
  -- Tmux/zellij integration for seamless navigation
  { import = "astrocommunity.terminal-integration.vim-tmux-navigator" },

  -- Enhanced toggleterm
  {
    "akinsho/toggleterm.nvim",
    opts = {
      size = function(term)
        if term.direction == "horizontal" then return 15
        elseif term.direction == "vertical" then return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = { border = "Normal", background = "Normal" },
      },
    },
    keys = {
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>",              desc = "Terminal float" },
      { "<leader>th", "<cmd>ToggleTerm size=15 direction=horizontal<cr>", desc = "Terminal horizontal" },
      { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>",   desc = "Terminal vertical" },
      { "<leader>tt", "<cmd>ToggleTerm<cr>",                              desc = "Toggle terminal" },
      -- DevOps TUIs
      { "<leader>tg", function()
        require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" }):toggle()
      end, desc = "LazyGit" },
      { "<leader>tk", function()
        require("toggleterm.terminal").Terminal:new({ cmd = "k9s", hidden = true, direction = "float" }):toggle()
      end, desc = "K9s" },
      { "<leader>tl", function()
        require("toggleterm.terminal").Terminal:new({ cmd = "lazydocker", hidden = true, direction = "float" }):toggle()
      end, desc = "LazyDocker" },
      { "<leader>tb", function()
        require("toggleterm.terminal").Terminal:new({ cmd = "btm", hidden = true, direction = "float" }):toggle()
      end, desc = "Bottom (system monitor)" },
    },
  },

  -- Terminal file manager (yazi is more modern; keeping ranger lf for muscle memory)
  {
    "is0n/fm-nvim",
    cmd = { "Ranger", "Lf", "Fzf", "Vifm", "Broot", "Gitui", "Joshuto" },
    opts = {
      ui = {
        default = "float",
        float = { border = "rounded", height = 0.9, width = 0.9 },
      },
    },
    keys = {
      { "<leader>fr", "<cmd>Ranger<cr>", desc = "Ranger file manager" },
      { "<leader>fl", "<cmd>Lf<cr>",     desc = "Lf file manager" },
    },
  },
}
