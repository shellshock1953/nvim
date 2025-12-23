return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        -- Goose ACP adapter configuration
        goose = function()
          return require("codecompanion.adapters").extend("goose", {
            env = {
              cmd = "/opt/homebrew/bin/goose",
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "goose", -- Set goose as default for chat
        },
        inline = {
          adapter = "goose",
        },
      },
      display = {
        chat = {
          window = {
            layout = "vertical", -- vertical|horizontal|float
            border = "rounded",
            height = 0.8,
            width = 0.45,
          },
        },
      },
      opts = {
        log_level = "DEBUG", -- DEBUG for troubleshooting
      },
    })
  end,
  -- Keybindings
  keys = {
    { "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle CodeCompanion Chat" },
    { "<leader>ca", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "CodeCompanion Actions" },
    { "ga", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add to CodeCompanion Chat" },
  },
  cmd = {
    "CodeCompanion",
    "CodeCompanionChat",
    "CodeCompanionActions",
  },
}
