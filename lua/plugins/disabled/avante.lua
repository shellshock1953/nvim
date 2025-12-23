return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  build = vim.fn.has("win32") ~= 0
      and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    -- Enable debug mode to see detailed logs
    debug = false, -- Set to true if you need to debug ACP communication

    -- Project-specific instructions file
    instructions_file = "avante.md",

    -- ACP Provider Configuration for Goose
    provider = "goose",

    -- ACP providers table
    acp_providers = {
    -- ["gemini-cli"] = {
    --   command = "gemini",
    --   args = { "--experimental-acp" },
    --   -- env = {
    --   --   NODE_NO_WARNINGS = "1",
    --   --   GEMINI_API_KEY = os.getenv("GEMINI_API_KEY"),
    --   -- },
    -- },
      ["goose"] = {
        command = "goose",
        args = { "acp" },
        -- Add environment variables if needed by goose
        -- env = {
        --   HOME = os.getenv("HOME"),
        --   -- Ensure PATH includes goose location
        --   PATH = os.getenv("PATH"),
        -- },
      },
    },

    -- Behavior settings
    behaviour = {
      auto_suggestions = false, -- Disable auto-suggestions to avoid high-frequency requests
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = true,
    },

    -- Keymaps
    mappings = {
      ask = "<leader>aa",
      edit = "<leader>ae",
      refresh = "<leader>ar",
      diff = {
        ours = "co",
        theirs = "ct",
        all_theirs = "ca",
        both = "cb",
        cursor = "cc",
        next = "]x",
        prev = "[x",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
      submit = {
        normal = "<CR>",
        insert = "<C-s>",
      },
      toggle = {
        default = "<leader>at",
        debug = "<leader>ad",
        hint = "<leader>ah",
      },
      sidebar = {
        switch_windows = "<Tab>",
        reverse_switch_windows = "<S-Tab>",
      },
    },

    -- UI Hints
    hints = { enabled = true },

    -- Window settings
    windows = {
      wrap = true,
      width = 30,
      sidebar_header = {
        align = "center",
        rounded = true,
      },
    },

    -- Highlights
    highlights = {
      diff = {
        current = "DiffText",
        incoming = "DiffAdd",
      },
    },

    -- Diff settings
    diff = {
      autojump = true,
      list_opener = "copen",
    },
  },

  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",

    -- File selector providers (pick one that you use)
    "nvim-telescope/telescope.nvim",

    -- Autocompletion for avante commands
    "hrsh7th/nvim-cmp",

    -- Icons
    "nvim-tree/nvim-web-devicons",

    -- Image pasting support
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },

    -- Markdown rendering
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
