return {
  "jay-babu/project.nvim",
  main = "project_nvim",
  event = "VeryLazy",
  opts = {
    -- Manual mode doesn't automatically change your root directory, so you have
    -- the option to manually do so using `:ProjectRoot` command.
    manual_mode = false,

    -- Because autochdir can conflict with this plugin to cause buggy behaviour,
    -- this plugin will disable autochdir by default.
    unset_autochdir = true,

    -- Methods of detecting the root directory. **"lsp"** uses the native neovim
    -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
    -- order matters: if one is not detected, the other is used as fallback. You
    -- can also delete or rearangne the detection methods.
    detection_methods = { "pattern" },

    -- All the patterns used to detect root dir, when **"pattern"** is in
    -- detection_methods
    patterns = { ".git" },

    -- Table of lsp clients to ignore by name
    -- eg: { "efm", ... }
    ignore_lsp = {},

    -- Don't calculate root dir on specific directories
    -- Ex: { "~/.cargo/*", ... }
    exclude_dirs = {},

    -- Show hidden files in telescope
    show_hidden = false,

    -- When set to false, you will get a message when project.nvim changes your
    -- directory.
    silent_chdir = true,

    -- What scope to change the directory, valid options are
    -- * global (default)
    -- * tab
    -- * win
    scope_chdir = 'global',

    -- Path where project.nvim will store the project history for use in
    -- telescope
    datapath = vim.fn.stdpath("data"),

    -- Allows the user to declare a custom callback to execute on project
    -- before a new project is selected and the working directory is changed.
    -- Setting this to false means that nothing will be executed.
    before_project_selection_callback = function() end,

    -- Allows the user to declare a custom callback to execute on project
    -- selection. Setting this to false means that nothing will be executed.
    after_project_selection_callback = function() end,
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
