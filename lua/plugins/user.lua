local opt = vim.opt   -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'                       -- Enable mouse support
opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
opt.swapfile = false                  -- Don't use swapfile
opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true           -- Show line number
opt.showmatch = true        -- Highlight matching parenthesis
opt.foldmethod = 'marker'   -- Enable folding (default 'foldmarker')
-- opt.colorcolumn = '80'      -- Line lenght marker at 80 columns
opt.cursorcolumn = true
opt.splitright = true       -- Vertical split to the right
opt.splitbelow = true       -- Horizontal split to the bottom
opt.ignorecase = true       -- Ignore case letters when search
opt.smartcase = true        -- Ignore lowercase for the whole pattern
opt.linebreak = true        -- Wrap on word boundary
opt.termguicolors = true    -- Enable 24-bit RGB colors
opt.laststatus=3            -- Set global statusline

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true        -- Use spaces instead of tabs
opt.shiftwidth = 4          -- Shift 4 spaces when tab
opt.tabstop = 4             -- 1 tab == 4 spaces
opt.smartindent = true      -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true           -- Enable background buffers
opt.history = 100           -- Remember N lines in history
opt.lazyredraw = true       -- Faster scrolling
opt.synmaxcol = 240         -- Max column for syntax highlight
opt.updatetime = 250        -- ms to wait for trigger an event

return {
  -- Additional mappings for DevOps workflows
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          -- DevOps navigation groups
          ["<leader>k"] = { desc = "Kubernetes" },
          ["<leader>d"] = { desc = "Docker/DevOps" },
          ["<leader>g"] = { desc = "Git" },
          ["<leader>t"] = { desc = "Terminal" },
          ["<leader>r"] = { desc = "Run/Replace" },
          ["<leader>x"] = { desc = "eXtra tools" },
          ["<leader>y"] = { desc = "YAML tools" },
          ["<leader>a"] = { desc = "API testing" },
          ["<leader>j"] = { desc = "JSON tools" },
          
          -- Quick access to common DevOps files
          ["<leader>fk"] = { "<cmd>Telescope find_files find_command=rg,--files,--glob,**/*.{yaml,yml},--glob,!.git<cr>", desc = "Find YAML files" },
          ["<leader>ft"] = { "<cmd>Telescope find_files find_command=rg,--files,--glob,**/*.{tf,tfvars},--glob,!.git<cr>", desc = "Find Terraform files" },
          ["<leader>fd"] = { "<cmd>Telescope find_files find_command=rg,--files,--glob,**/Dockerfile*,--glob,**/*docker-compose*.{yml,yaml},--glob,!.git<cr>", desc = "Find Docker files" },
          ["<leader>fh"] = { "<cmd>Telescope find_files find_command=rg,--files,--glob,**/*values*.{yaml,yml},--glob,**/Chart.yaml,--glob,!.git<cr>", desc = "Find Helm files" },
          
          -- Git shortcuts (removed conflicts with AstroNvim defaults)
          -- AstroNvim already provides: gb (branches), gc (commits), gt (status)
          -- Use <leader>tl for lazygit (your preferred tool)
          ["<leader>gP"] = { "<cmd>Git push<cr>", desc = "Git push" },
          ["<leader>gp"] = { "<cmd>Git pull<cr>", desc = "Git pull" },
          
          -- Quick edits
          ["<leader>ek"] = { "<cmd>e ~/.kube/config<cr>", desc = "Edit kubeconfig" },
          ["<leader>es"] = { "<cmd>e ~/.ssh/config<cr>", desc = "Edit SSH config" },
          ["<leader>ea"] = { "<cmd>e ~/.aws/credentials<cr>", desc = "Edit AWS credentials" },
          ["<leader>et"] = { "<cmd>e ~/.terraformrc<cr>", desc = "Edit Terraform RC" },
        },
        v = {
          -- Visual mode DevOps mappings
          ["<leader>k"] = { desc = "Kubernetes" },
          ["<leader>d"] = { desc = "Docker/DevOps" },
          ["<leader>x"] = { desc = "eXtra tools" },
        },
        -- Normal mode window management
        n = {
          -- Window maximize/restore toggle (like Zellij Ctrl+a+z)
          ["<C-w>z"] = {
            function()
              vim.t.zoom_winrestcmd = vim.t.zoom_winrestcmd or nil
              if vim.t.zoom_winrestcmd then
                -- Restore windows
                vim.cmd(vim.t.zoom_winrestcmd)
                vim.t.zoom_winrestcmd = nil
              else
                -- Save current window configuration
                vim.t.zoom_winrestcmd = vim.fn.winrestcmd()
                -- Maximize current window
                vim.cmd("resize")
                vim.cmd("vertical resize")
              end
            end,
            desc = "Toggle window maximize/restore"
          },
        },
      },
    },
  },
}
