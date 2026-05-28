-- Git integration: diffview, blame, worktree, GitHub PRs
return {
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.git-blame-nvim" },

  -- Git worktree
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

  -- GitHub PRs/issues
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "Octo",
    opts = { enable_builtin = true },
    keys = {
      { "<leader>gO",  "<cmd>Octo<cr>",            desc = "Octo (GitHub)" },
      { "<leader>gOp", "<cmd>Octo pr list<cr>",    desc = "List PRs" },
      { "<leader>gOi", "<cmd>Octo issue list<cr>", desc = "List issues" },
    },
  },
}
