return {
  "jay-babu/project.nvim",
  main = "project_nvim",
  event = "VeryLazy",
  opts = {
    ignore_lsp = { "lua_ls" },
    manual_mode = true,  -- Add this line
    detection_methods = { "pattern" },  -- Add this to reduce automatic behavior
    patterns = { ".git" },  -- Specify patterns you want to use
    scope_chdir = false,    -- Add this to prevent automatic directory changes
  },
  specs = {
    { "AstroNvim/astrocore", opts = { rooter = { enabled = false } } },
    {
      "nvim-telescope/telescope.nvim",
      optional = true,
      dependencies = { "jay-babu/project.nvim" },
      opts = function() require("telescope").load_extension "projects" end,
    },
  },
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>P"] = { "<Cmd>Telescope projects<CR>", desc = "Open Project panel" },
          },
        },
      },
    },
  }
}
