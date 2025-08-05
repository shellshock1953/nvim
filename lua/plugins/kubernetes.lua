-- Kubernetes integration following AstroNvim conventions
return {
  -- Enhanced Kubernetes YAML support
  { import = "astrocommunity.pack.ansible" }, -- Provides K8s YAML schemas
  
  -- Professional kubectl integration
  {
    "Ramilito/kubectl.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "Kubectl" },
    config = function()
      require("kubectl").setup({
        auto_refresh = {
          enabled = true,
          interval = 300, -- 5 minutes
        },
        diff = {
          bin = "kubectl-neat",
        },
        log_level = "info",
        buffer_options = {
          modifiable = true,
        },
      })
    end,
    keys = {
      { "<leader>k", "", desc = "Kubernetes" },
      { "<leader>kk", "<cmd>Kubectl<cr>", desc = "kubectl UI" },
      { "<leader>kp", "<cmd>Kubectl pods<cr>", desc = "Pods" },
      { "<leader>ks", "<cmd>Kubectl services<cr>", desc = "Services" },
      { "<leader>kd", "<cmd>Kubectl deployments<cr>", desc = "Deployments" },
      { "<leader>ki", "<cmd>Kubectl ingresses<cr>", desc = "Ingresses" },
      { "<leader>kn", "<cmd>Kubectl namespaces<cr>", desc = "Namespaces" },
    },
  },
  
  -- YAML enhancements for better K8s manifest editing
  {
    "cuducos/yaml.nvim",
    ft = { "yaml" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("yaml").setup({
        ft = { "yaml" },
      })
    end,
  },
}