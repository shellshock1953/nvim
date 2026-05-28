-- Customize Mason plugins
-- NOTE: mason-lspconfig v2 uses mason-org org name

---@type LazySpec
return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "bashls",
        "yamlls",
        "jsonls",
        "dockerls",
        "docker_compose_language_service",
        "terraformls",
        "helm_ls",
        "pyright",
      },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        "stylua",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = {
        "python",
      },
    },
  },
}
