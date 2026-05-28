-- .env file handling
return {
  -- Source .env into shell-script buffers
  {
    "ellisonleao/dotenv.nvim",
    ft = { "sh", "bash", "zsh", "env" },
    config = true,
  },

  -- ecolog: env autocompletion, peek, goto (lazy-load on cmd + filetype)
  {
    "philosofonusus/ecolog.nvim",
    cmd = { "EcologGoto", "EcologSelect", "EcologPeek", "EcologShelter" },
    event = { "BufReadPre .env*", "BufNewFile .env*" },
    keys = {
      { "<leader>ce", "<cmd>EcologGoto<cr>",   desc = "Goto .env" },
      { "<leader>cs", "<cmd>EcologSelect<cr>", desc = "Select .env" },
      { "<leader>cp", "<cmd>EcologPeek<cr>",   desc = "Peek .env" },
    },
    opts = {
      integrations = { lsp = true, nvim_cmp = false },
      path = vim.fn.getcwd(),
      preferred_environment = "local",
    },
  },
}
