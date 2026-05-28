-- DevOps / IaC tooling: terraform, ansible, helm
return {
  -- Terraform syntax + commands (astrocommunity provides terraformls + treesitter)
  {
    "hashivim/vim-terraform",
    ft = { "terraform", "tf", "tfvars", "hcl" },
    config = function()
      vim.g.terraform_align = 1
      vim.g.terraform_fmt_on_save = 0
      vim.g.terraform_fold_sections = 1
    end,
  },

  -- Telescope terraform docs
  {
    "ANGkeith/telescope-terraform-doc.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    ft = { "terraform", "tf", "tfvars", "hcl" },
    config = function() require("telescope").load_extension("terraform_doc") end,
    keys = {
      { "<leader>td", "<cmd>Telescope terraform_doc<cr>", desc = "Terraform docs", ft = "terraform" },
    },
  },

  -- Ansible filetype/syntax
  {
    "pearofducks/ansible-vim",
    ft = { "yaml.ansible", "yaml.cloudformation", "yml.ansible" },
    config = function()
      vim.g.ansible_unindent_after_newline = 1
      vim.g.ansible_extra_keywords_highlight = 1
      vim.g.ansible_attribute_highlight = "ob"
      vim.g.ansible_name_highlight = "b"
      vim.g.ansible_template_syntaxes = {
        ["*.json.j2"] = "json",
        ["*.yaml.j2"] = "yaml",
        ["*.yml.j2"] = "yaml",
      }
    end,
  },

  -- AWS S3 file editing
  {
    "kiran94/s3edit.nvim",
    cmd = { "S3Edit", "S3View" },
    config = true,
    keys = {
      { "<leader>aS", "<cmd>S3Edit<cr>", desc = "S3 Edit" },
    },
  },

  -- SOPS encrypted secret editing
  {
    "lucidph3nx/nvim-sops",
    event = "BufRead",
    opts = {},
  },

  -- HTTP client (modern rest.nvim successor)
  {
    "mistweaverco/kulala.nvim",
    keys = {
      { "<leader>Rs", function() require("kulala").run() end, desc = "Send request" },
      { "<leader>Ra", function() require("kulala").run_all() end, desc = "Send all" },
      { "<leader>Rr", function() require("kulala").replay() end, desc = "Replay last" },
      { "<leader>Rt", function() require("kulala").toggle_view() end, desc = "Toggle headers/body" },
      { "<leader>Rc", function() require("kulala").copy() end, desc = "Copy as curl" },
    },
    ft = { "http", "rest" },
    opts = {
      global_keymaps = false,
      ui = { display_mode = "split" },
    },
  },
}
