---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },
      autopairs = true,
      diagnostics = { virtual_text = true, virtual_lines = false },
      highlighturl = true,
      notifications = true,
    },
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    options = {
      opt = {
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = false,
        -- from user.lua
        mouse = "a",
        clipboard = "unnamedplus",
        swapfile = false,
        completeopt = "menuone,noinsert,noselect",
        showmatch = true,
        cursorcolumn = true,
        splitright = true,
        splitbelow = true,
        ignorecase = true,
        smartcase = true,
        linebreak = true,
        termguicolors = true,
        laststatus = 3,
        expandtab = true,
        shiftwidth = 4,
        tabstop = 4,
        smartindent = true,
        hidden = true,
        history = 100,
        synmaxcol = 240,
        updatetime = 250,
        fixendofline = true,
      },
      g = {},
    },
    mappings = {
      n = {
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
        -- DevOps which-key groups
        ["<leader>k"] = { desc = "Kubernetes" },
        ["<leader>g"] = { desc = "Git" },
        ["<leader>gO"] = { desc = "GitHub (Octo)" },
        ["<leader>t"] = { desc = "Terminal/TUIs" },
        ["<leader>T"] = { desc = "Time tracking" },
        ["<leader>r"] = { desc = "Run/Replace" },
        ["<leader>R"] = { desc = "REST (kulala)" },
        ["<leader>x"] = { desc = "eXtra (base64)" },
        ["<leader>y"] = { desc = "YAML tools" },
        ["<leader>j"] = { desc = "JSON tools" },
        ["<leader>c"] = { desc = ".env (ecolog)" },
        ["<leader>a"] = { desc = "AWS/cloud" },
        ["<leader>e"] = { desc = "Edit dotfiles" },
        -- Quick access to common DevOps files
        ["<leader>fk"] = { "<cmd>Telescope find_files find_command=rg,--files,--glob,**/*.{yaml,yml},--glob,!.git<cr>", desc = "Find YAML files" },
        ["<leader>ft"] = { "<cmd>Telescope find_files find_command=rg,--files,--glob,**/*.{tf,tfvars},--glob,!.git<cr>", desc = "Find Terraform files" },
        ["<leader>fd"] = { "<cmd>Telescope find_files find_command=rg,--files,--glob,**/Dockerfile*,--glob,**/*docker-compose*.{yml,yaml},--glob,!.git<cr>", desc = "Find Docker files" },
        ["<leader>fh"] = { "<cmd>Telescope find_files find_command=rg,--files,--glob,**/*values*.{yaml,yml},--glob,**/Chart.yaml,--glob,!.git<cr>", desc = "Find Helm files" },
        -- Git shortcuts
        ["<leader>gP"] = { "<cmd>Git push<cr>", desc = "Git push" },
        ["<leader>gp"] = { "<cmd>Git pull<cr>", desc = "Git pull" },
        -- Quick edits
        ["<leader>ek"] = { "<cmd>e ~/.kube/config<cr>", desc = "Edit kubeconfig" },
        ["<leader>es"] = { "<cmd>e ~/.ssh/config<cr>", desc = "Edit SSH config" },
        ["<leader>ea"] = { "<cmd>e ~/.aws/credentials<cr>", desc = "Edit AWS credentials" },
        ["<leader>et"] = { "<cmd>e ~/.terraformrc<cr>", desc = "Edit Terraform RC" },
        -- Buffer management
        ["<leader>bb"] = { "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
        -- Window maximize/restore toggle
        ["<C-w>z"] = {
          function()
            vim.t.zoom_winrestcmd = vim.t.zoom_winrestcmd or nil
            if vim.t.zoom_winrestcmd then
              vim.cmd(vim.t.zoom_winrestcmd)
              vim.t.zoom_winrestcmd = nil
            else
              vim.t.zoom_winrestcmd = vim.fn.winrestcmd()
              vim.cmd("resize")
              vim.cmd("vertical resize")
            end
          end,
          desc = "Toggle window maximize/restore",
        },
      },
      v = {
        ["<leader>x"] = { desc = "eXtra (base64)" },
      },
    },
  },
}
