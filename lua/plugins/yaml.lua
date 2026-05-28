-- YAML tooling: schema selection + folding
return {
  -- Schemas for json/yamlls (loaded lazily by astrolsp)
  { "b0o/schemastore.nvim", lazy = true, version = false },

  -- YAML folding for large manifests
  {
    "pedrohdz/vim-yaml-folds",
    ft = { "yaml", "yml" },
    config = function() vim.g.yaml_fold_override_foldtext = 1 end,
  },

  -- Interactive schema selection (yaml-companion)
  {
    "someone-stole-my-name/yaml-companion.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    ft = { "yaml", "yml" },
    config = function()
      require("telescope").load_extension("yaml_schema")
      local cfg = require("yaml-companion").setup({
        builtin_matchers = {
          kubernetes = { enabled = true },
          cloud_init = { enabled = true },
        },
        schemas = {
          { name = "Argo CD Application",
            uri = "https://raw.githubusercontent.com/argoproj/argo-schema-generator/main/schema/argo_all_k8s_kustomize_schema.json" },
          { name = "Argo Workflows",
            uri = "https://raw.githubusercontent.com/argoproj/argo-schema-generator/main/schema/argo_workflows_schema.json" },
          { name = "GitHub Actions",
            uri = "https://json.schemastore.org/github-workflow.json" },
          { name = "docker-compose",
            uri = "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json" },
        },
      })
      require("lspconfig")["yamlls"].setup(cfg)
    end,
    keys = {
      { "<leader>ys", "<cmd>Telescope yaml_schema<cr>", desc = "YAML Schema" },
    },
  },

  -- JSON/YAML path
  {
    "mogelbrod/vim-jsonpath",
    ft = { "json", "yaml", "yml" },
    config = function() vim.g.jsonpath_register = "+" end,
    keys = {
      { "<leader>jp", "<cmd>JsonPath<cr>", desc = "Show JSON path", ft = { "json", "yaml", "yml" } },
    },
  },
}
