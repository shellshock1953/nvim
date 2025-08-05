return {
  -- ToggleTerm is already included in AstroNvim by default
  
  -- Tmux integration for seamless navigation
  { import = "astrocommunity.terminal-integration.vim-tmux-navigator" },
  
  -- Enhanced toggleterm configuration
  {
    "akinsho/toggleterm.nvim",
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
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
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    },
    keys = {
      { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal float" },
      { "<leader>th", "<cmd>ToggleTerm size=15 direction=horizontal<cr>", desc = "Terminal horizontal" },
      { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Terminal vertical" },
      { "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
      -- DevOps specific terminals
      { "<leader>tg", function()
        local Terminal = require("toggleterm.terminal").Terminal
        local gitui = Terminal:new({ cmd = "gitui", hidden = true, direction = "float" })
        gitui:toggle()
      end, desc = "GitUI" },
      { "<leader>tk", function()
        local Terminal = require("toggleterm.terminal").Terminal
        local k9s = Terminal:new({ cmd = "k9s", hidden = true, direction = "float" })
        k9s:toggle()
      end, desc = "K9s" },
      { "<leader>tl", function()
        local Terminal = require("toggleterm.terminal").Terminal
        local lazydocker = Terminal:new({ cmd = "lazydocker", hidden = true, direction = "float" })
        lazydocker:toggle()
      end, desc = "LazyDocker" },
      { "<leader>tb", function()
        local Terminal = require("toggleterm.terminal").Terminal
        local btm = Terminal:new({ cmd = "btm", hidden = true, direction = "float" })
        btm:toggle()
      end, desc = "Bottom (system monitor)" },
    },
  },
  
  -- Terminal file manager
  {
    "is0n/fm-nvim",
    cmd = { "Ranger", "Nnn", "Fff", "Twf", "Fzf", "Vifm", "Broot", "Gitui", "Joshuto", "Lf" },
    config = function()
      require("fm-nvim").setup({
        ui = {
          default = "float",
          float = {
            border = "rounded",
            height = 0.9,
            width = 0.9,
          },
        },
      })
    end,
    keys = {
      { "<leader>fr", "<cmd>Ranger<cr>", desc = "Ranger file manager" },
      { "<leader>fl", "<cmd>Lf<cr>", desc = "Lf file manager" },
    },
  },
}