-- Cloud infrastructure tools following AstroNvim patterns
return {
  -- Professional Terraform support with enhanced LSP
  {
    "hashivim/vim-terraform",
    ft = { "terraform", "tf", "tfvars", "hcl" },
    config = function()
      vim.g.terraform_align = 1
      vim.g.terraform_fmt_on_save = 0
      vim.g.terraform_fold_sections = 1
    end,
  },
  
  -- Advanced Infrastructure as Code support
  {
    "pearofducks/ansible-vim",
    ft = { "yaml.ansible", "yaml.cloudformation", "yml.ansible" },
    config = function()
      vim.g.ansible_unindent_after_newline = 1
      vim.g.ansible_extra_keywords_highlight = 1
      vim.g.ansible_attribute_highlight = "ob"
      vim.g.ansible_name_highlight = "b"
      vim.g.ansible_name_highlight = "b"
      vim.g.ansible_template_syntaxes = {
        ["*.json.j2"] = "json",
        ["*.yaml.j2"] = "yaml",
        ["*.yml.j2"] = "yaml",
      }
    end,
  },
  
  -- AWS cloud integration
  {
    "kiran94/s3edit.nvim",
    cmd = { "S3Edit", "S3View" },
    config = true,
    keys = {
      { "<leader>aws", "<cmd>S3Edit<cr>", desc = "S3 Edit" },
    },
  },
  
  -- Terraform validation and planning helper
  {
    "ANGkeith/telescope-terraform-doc.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    ft = { "terraform", "tf", "tfvars", "hcl" },
    config = function()
      require("telescope").load_extension("terraform_doc")
    end,
    keys = {
      { "<leader>td", "<cmd>Telescope terraform_doc<cr>", desc = "Terraform docs", ft = "terraform" },
    },
  },
}