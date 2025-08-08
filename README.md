# Professional DevOps Neovim Configuration

A production-ready AstroNvim v4 configuration optimized for DevOps engineers working with Kubernetes, Terraform, AWS/Azure, ArgoCD, Helm, Python, and Bash.

## Quick Reference

### AstroNvim Default Mappings

Leader Key: `<Space>` (` `)

#### Core Navigation & Files
- `<C-h/j/k/l>` - Window navigation
- `<C-Up/Down/Left/Right>` - Window resizing
- `<C-w>z` - Toggle window maximize/restore (like Zellij)
- `<C-s>` - Force write (save)
- `<C-q>` - Force quit
- `<leader>n` - New file
- `<leader>R` - Rename file
- `<leader>c` - Close buffer
- `]b` / `[b` - Next/Previous buffer
- `>b` / `<b` - Move buffer

#### File & Search (Telescope)
- `<leader>ff` - Find files
- `<leader>fw` - Live grep (search in files)
- `<leader>fb` - Find buffers
- `<leader>fh` - Find help
- `<leader>fm` - Find marks
- `<leader>fo` - Find old files
- `<leader>sb` - Git branches
- `<leader>sc` - Git commits
- `<leader>st` - Git status

#### LSP (Language Server)
- `K` - Hover documentation
- `gd` - Go to definition
- `gD` - Go to declaration
- `gI` - Go to implementation
- `gr` - Go to references
- `<leader>lf` - Format document
- `<leader>la` - Code actions
- `<leader>lr` - Rename symbol
- `<leader>ld` - Document diagnostics
- `<leader>lw` - Workspace diagnostics
- `gl` - Line diagnostics
- `]d` / `[d` - Next/Previous diagnostic

#### Buffer Management
- `<leader>bb` - Buffer picker
- `<leader>bc` - Close current buffer
- `<leader>bC` - Close all buffers
- `<leader>bl` - Close buffers to left
- `<leader>br` - Close buffers to right
- `<leader>bp` - Pick buffer to close

#### Terminal (ToggleTerm)
- `<leader>tf` - Floating terminal
- `<leader>th` - Horizontal terminal  
- `<leader>tv` - Vertical terminal
- `<leader>tt` - Toggle terminal

#### File Manager (Neo-tree)
- `<leader>e` - Toggle Neo-tree
- `<leader>o` - Focus Neo-tree

#### Git (Built-in)
- `<leader>gb` - Git branches (Telescope)
- `<leader>gc` - Git commits (Telescope)
- `<leader>gt` - Git status (Telescope)

#### UI Toggles
- `<leader>ud` - Toggle diagnostics
- `<leader>un` - Toggle line numbers
- `<leader>us` - Toggle spell check
- `<leader>uw` - Toggle word wrap

### DevOps Extensions

#### Kubernetes Operations
- `<leader>k` - Kubernetes menu
- `<leader>kk` - kubectl UI (interactive)
- `<leader>kp` - List pods
- `<leader>ks` - List services  
- `<leader>kd` - List deployments
- `<leader>ki` - List ingresses
- `<leader>kn` - Switch namespaces

#### Docker & Containers
- `<leader>d` - Docker menu
- `<leader>dc` - Docker containers
- `<leader>di` - Docker images
- `<leader>tl` - LazyDocker (terminal UI)

#### DevOps Tools
- `<leader>dt` - DevOps tools menu
- `<leader>dtd` - Docker PS
- `<leader>dth` - Helm list
- `<leader>dtt` - Terraform plan
- `<leader>dtk` - kubectl get pods

#### Git Operations
- `<leader>tl` - LazyGit (preferred)
- `<leader>gb` - Git branches (Telescope)
- `<leader>gc` - Git commits (Telescope)
- `<leader>gt` - Git status (Telescope)
- `<leader>gP` - Git push
- `<leader>gp` - Git pull
- `<leader>ghp` - Preview hunk
- `<leader>ghb` - Blame line

#### Terminal & Tools
- `<leader>tf` - Floating terminal
- `<leader>th` - Horizontal terminal
- `<leader>tv` - Vertical terminal
- `<leader>tk` - K9s (Kubernetes TUI)
- `<leader>ttp` - Terraform plan terminal

#### File Navigation
- `<leader>e` - Toggle Neo-tree (file manager)
- `<leader>o` - Focus Neo-tree (switch to file manager)
- `<leader>fk` - Find YAML files
- `<leader>ft` - Find Terraform files
- `<leader>fd` - Find Docker files
- `<leader>fh` - Find Helm files
- `<leader>fr` - Ranger file manager
- `<leader>fl` - Lf file manager

#### Run/Replace Operations
- `<leader>rr` - Search and replace (rip-substitute)
- `<leader>rn` - Run task (Overseer)
- `<leader>rt` - Task list (Overseer)
- `<leader>ri` - Task info (Overseer)

#### Productivity Tools
- `<leader>pt` - Toggle time tracking
- `<leader>pr` - Time report
- `<leader>bb` - Find buffers (Telescope)
- `<leader>xe` - Base64 encode
- `<leader>xd` - Base64 decode

#### Environment & Config
- `<leader>ce` - Goto .env file
- `<leader>cs` - Select .env file
- `<leader>cp` - Peek .env file
- `<leader>ys` - YAML schema selection

#### API Testing
- `<leader>ar` - Execute API request (*.http files)

#### JSON/YAML Tools
- `<leader>jp` - Show JSON path at cursor
- `<leader>ys` - YAML schema selection

## Language Server Features

### Terraform
- **terraformls** - Official Terraform LSP
- **tflint** - Linting and best practices
- Auto-formatting with `terraform fmt`
- Resource documentation on hover

### YAML/Kubernetes
- **yamlls** - YAML language server
- Kubernetes schema validation
- ArgoCD schema support
- Helm chart validation

### Python (DevOps Scripts)
- **pyright** - Type checking
- Auto-imports and refactoring
- Virtual environment detection

### Bash/Shell
- **bashls** - Shell script LSP
- Syntax checking and completion

## Productivity Features

### Time Management
- **Pendulum** tracks coding sessions
- Automatic reports generation
- Project-specific time tracking

### Environment Management
- **ecolog.nvim** for .env files
- Auto-completion for environment variables
- Secure credential handling

### Buffer Management
- Fast buffer switching
- Project-specific buffer groups
- Automatic session management

## Installation & Setup

### Prerequisites
```bash
# Required CLI tools
brew install k9s lazydocker kubectl terraform helm
brew install ripgrep fd fzf bat

# Optional but recommended
brew install kubectl-neat
cargo install selene  # Lua linting
```

### LSP Servers
After starting Neovim:
```
:Mason
```
Install: terraformls, yamlls, bashls, dockerls, jsonls

### First Launch
1. Start Neovim
2. Run `:Lazy` to install plugins
3. Run `:Mason` to install LSP servers
4. Restart Neovim

## Customization

### Adding New Tools
Create new files in `lua/plugins/`:
```lua
-- lua/plugins/my-tool.lua
return {
  "author/plugin-name",
  config = function()
    -- configuration
  end,
}
```

### Environment-Specific Settings
Use `.nvim.lua` in project root:
```lua
-- Project-specific configuration
vim.g.terraform_version = "1.5.0"
vim.g.kubernetes_context = "production"
```

## Troubleshooting

### Common Issues
1. **LSP not working**: Run `:LspInfo` to check server status
2. **Plugins not loading**: Run `:Lazy` to check plugin status
3. **Keybinds not working**: Check `:map <leader>` for conflicts

### Performance
- Large YAML files: Use folding (`zc`/`zo`)
- Multiple projects: Use `:cd` to switch contexts
- Memory usage: Restart Neovim periodically for long sessions

### Logs
- Neovim logs: `:messages`
- Plugin logs: `:Lazy log`
- LSP logs: `:LspLog`

## Advanced Workflows

### GitOps Pipeline
1. Edit manifests with schema validation
2. Local testing with kubectl/k9s
3. Commit changes via LazyGit
4. Monitor ArgoCD sync status

### Infrastructure as Code
1. Terraform planning in dedicated terminal
2. Resource documentation lookup
3. State management with remote backends
4. Cross-environment deployments

### Monitoring & Observability
1. Log analysis with enhanced search
2. Configuration drift detection
3. Resource utilization tracking
4. Performance bottleneck identification

This configuration provides a complete DevOps workspace optimized for real-world infrastructure management, application deployment, and operational tasks.
