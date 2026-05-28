-- Copilot with blink.cmp (v6 uses blink.cmp instead of nvim-cmp)
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = { enabled = false },
        suggestion = { enabled = false },
        filetypes = {
          ["*"] = true,
        },
      })
    end,
  },
  {
    "fang2hou/blink-copilot",
    dependencies = { "zbirenbaum/copilot.lua" },
  },
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      sources = {
        default = { "copilot", "lsp", "path", "snippets", "buffer" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
    },
  },
}
