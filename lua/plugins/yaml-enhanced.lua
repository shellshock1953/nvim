return {
  -- YAML folding for large manifests
  {
    "pedrohdz/vim-yaml-folds",
    ft = { "yaml", "yml" },
  },
  
  -- Schema validation and selection
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
          -- Kubernetes schemas
          kubernetes = { enabled = true },
          cloud_init = { enabled = true },
        },
        schemas = {
          -- Additional schemas for DevOps tools
          {
            name = "Argo CD Application",
            uri = "https://raw.githubusercontent.com/argoproj/argo-schema-generator/main/schema/argo_all_k8s_kustomize_schema.json",
          },
          {
            name = "Argo Workflows",
            uri = "https://raw.githubusercontent.com/argoproj/argo-schema-generator/main/schema/argo_workflows_schema.json",
          },
          {
            name = "GitHub Actions",
            uri = "https://json.schemastore.org/github-workflow.json",
          },
          {
            name = "docker-compose",
            uri = "https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json",
          },
        },
        lspconfig = {
          settings = {
            yaml = {
              validate = true,
              format = { enable = true },
              hover = true,
              completion = true,
              customTags = {
                -- Helm template tags
                "!reference sequence",
                "!Sub",
                "!GetAtt",
                "!GetAZs",
                "!ImportValue",
                "!Select",
                "!Split",
                "!Join sequence",
                "!FindInMap sequence",
                "!Select sequence",
                "!Ref",
                "!Equals sequence",
                "!If sequence",
                "!Not sequence",
                "!And sequence",
                "!Or sequence",
                "!Base64",
                "!Cidr",
                "!Sub sequence",
              },
            },
          },
        },
      })
      require("lspconfig")["yamlls"].setup(cfg)
    end,
    keys = {
      { "<leader>ys", "<cmd>Telescope yaml_schema<cr>", desc = "YAML Schema" },
    },
  },
}