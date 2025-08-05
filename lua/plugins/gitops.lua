return {
  -- Git diff view for better code review
  { import = "astrocommunity.git.diffview-nvim" },
  
  -- Git blame inline
  { import = "astrocommunity.git.git-blame-nvim" },
  
  -- Commented out since you prefer lazygit (<leader>tl)
  -- Uncomment if you want additional git interfaces
  -- { import = "astrocommunity.git.neogit" },
  -- { import = "astrocommunity.git.vim-fugitive" },
  
  -- GitSigns enhancements
  -- {
  --   "lewis6991/gitsigns.nvim",
  --   opts = {
  --     signs = {
  --       add = { text = "│" },
  --       change = { text = "│" },
  --       delete = { text = "_" },
  --       topdelete = { text = "‾" },
  --       changedelete = { text = "~" },
  --       untracked = { text = "┆" },
  --     },
  --     signcolumn = true,
  --     numhl = false,
  --     linehl = false,
  --     word_diff = false,
  --     watch_gitdir = {
  --       follow_files = true,
  --     },
  --     attach_to_untracked = true,
  --     current_line_blame = true,
  --     current_line_blame_opts = {
  --       virt_text = true,
  --       virt_text_pos = "eol",
  --       delay = 1000,
  --       ignore_whitespace = false,
  --     },
  --     current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
  --     sign_priority = 6,
  --     update_debounce = 100,
  --     status_formatter = nil,
  --     max_file_length = 40000,
  --     preview_config = {
  --       border = "single",
  --       style = "minimal",
  --       relative = "cursor",
  --       row = 0,
  --       col = 1,
  --     },
  --   },
  --   keys = {
  --     { "<leader>ghp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
  --     { "<leader>ghb", "<cmd>Gitsigns blame_line<cr>", desc = "Blame line" },
  --     { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Diff this" },
  --     { "<leader>gD", "<cmd>Gitsigns diffthis ~<cr>", desc = "Diff this ~" },
  --   },
  -- },
  
  -- Git worktree support
  {
    "ThePrimeagen/git-worktree.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("git-worktree").setup()
      require("telescope").load_extension("git_worktree")
    end,
    keys = {
      { "<leader>gw", "<cmd>Telescope git_worktree git_worktrees<cr>", desc = "Git worktrees" },
      { "<leader>gW", "<cmd>Telescope git_worktree create_git_worktree<cr>", desc = "Create worktree" },
    },
  },
  
  -- GitHub integration
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "Octo",
    config = function()
      require("octo").setup({
        enable_builtin = true,
      })
    end,
    keys = {
      { "<leader>gO", "<cmd>Octo<cr>", desc = "Octo (GitHub)" },
      { "<leader>gOp", "<cmd>Octo pr list<cr>", desc = "List PRs" },
      { "<leader>gOi", "<cmd>Octo issue list<cr>", desc = "List issues" },
    },
  },
}
