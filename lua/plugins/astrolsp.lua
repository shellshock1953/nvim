-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      codelens = true,
      inlay_hints = false,
      semantic_tokens = true,
    },
    formatting = {
      format_on_save = {
        enabled = true,
        ignore_filetypes = {
          "terraform",
          "tf",
        },
      },
      disabled = {},
      timeout_ms = 1000,
    },
    servers = {},
    -- In v6, config["*"] holds default LSP options (capabilities, flags)
    config = {
      ["*"] = {},
      bashls = {},
      yamlls = {
        settings = {
          yaml = {
            schemas = {
              kubernetes = "*.yaml",
              ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
              ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
              ["https://raw.githubusercontent.com/argoproj/argo-schema-generator/main/schema/argo_all_k8s_kustomize_schema.json"] = "/*argo*.yaml",
              ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.{yml,yaml}",
            },
            validate = true,
            customTags = {
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
      jsonls = {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      },
      dockerls = {},
      docker_compose_language_service = {},
      terraformls = {},
      helm_ls = {
        settings = {
          ["helm-ls"] = {
            yamlls = {
              path = "yaml-language-server",
            },
          },
        },
      },
    },
    -- In v6, default handler uses "*" key instead of a plain function entry
    handlers = {
      ["*"] = function(server)
        vim.lsp.enable(server)
      end,
    },
    autocmds = {
      lsp_codelens_refresh = {
        cond = "textDocument/codeLens",
        {
          event = { "InsertLeave", "BufEnter" },
          desc = "Refresh codelens (buffer)",
          callback = function(args)
            if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
          end,
        },
      },
    },
    mappings = {
      n = {
        gD = {
          function() vim.lsp.buf.declaration() end,
          desc = "Declaration of current symbol",
          cond = "textDocument/declaration",
        },
        ["<Leader>uY"] = {
          function() require("astrolsp.toggles").buffer_semantic_tokens() end,
          desc = "Toggle LSP semantic highlight (buffer)",
          cond = function(client)
            return client.supports_method "textDocument/semanticTokens/full" and vim.lsp.semantic_tokens ~= nil
          end,
        },
      },
    },
    on_attach = function(client, bufnr)
    end,
  },
}
