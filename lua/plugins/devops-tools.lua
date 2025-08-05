-- Professional DevOps toolbox plugin for streamlined workflow
return {
  {
    "azratul/devops-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = {
      "DockerPs",
      "DockerImages",
      "DockerBuild",
      "DockerRun",
      "HelmList",
      "HelmInstall",
      "HelmUninstall",
      "KubectlGet",
      "KubectlApply",
      "KubectlDelete",
      "TerraformPlan",
      "TerraformApply",
      "TerraformDestroy",
    },
    config = function()
      require("devops-tools").setup({
        docker = {
          enabled = true,
        },
        helm = {
          enabled = true,
        },
        kubectl = {
          enabled = true,
        },
        terraform = {
          enabled = true,
        },
      })
    end,
    keys = {
      { "<leader>dt", "", desc = "DevOps Tools" },
      { "<leader>dtd", "<cmd>DockerPs<cr>", desc = "Docker PS" },
      { "<leader>dti", "<cmd>DockerImages<cr>", desc = "Docker Images" },
      { "<leader>dth", "<cmd>HelmList<cr>", desc = "Helm List" },
      { "<leader>dtk", "<cmd>KubectlGet pods<cr>", desc = "Kubectl Get Pods" },
      { "<leader>dtt", "<cmd>TerraformPlan<cr>", desc = "Terraform Plan" },
    },
  },
}