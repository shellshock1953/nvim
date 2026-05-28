-- Kubernetes tooling
return {
  -- kubectl-style explorer inside Neovim (alt to k9s for quick lookups)
  {
    "Ramilito/kubectl.nvim",
    cmd = { "Kubectl", "Kubectx", "Kubens" },
    keys = {
      { "<leader>kk", function() require("kubectl").toggle() end,    desc = "Kubectl toggle" },
      { "<leader>kc", "<cmd>Kubectx<cr>",                            desc = "Kube context" },
      { "<leader>kn", "<cmd>Kubens<cr>",                             desc = "Kube namespace" },
    },
    opts = {},
  },

  -- Helm filetype + chart workflow helpers (astrocommunity.pack.helm covers helmls + ts)
  -- Crossplane / kustomize editing benefit from yaml-companion (configured in yaml.lua)
}
