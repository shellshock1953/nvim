# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Neovim Configuration Overview

This is an **AstroNvim v6** based Neovim configuration that uses Lazy.nvim for plugin management. The configuration follows AstroNvim's modular Lua architecture.

## Key Files and Structure

### Core Configuration
- `init.lua` - Entry point that bootstraps Lazy.nvim
- `lua/lazy_setup.lua` - Lazy.nvim configuration and plugin loading
- `lua/community.lua` - AstroCommunity plugin imports
- `lua/plugins/` - Individual plugin configurations

### Important Plugin Files
- `lua/plugins/astrocore.lua` - Core vim options, keymaps, which-key groups, treesitter integration
- `lua/plugins/astrolsp.lua` - LSP configuration (format on save, server settings). NOTE: yamlls is configured by yaml-companion in `yaml.lua`, NOT here.
- `lua/plugins/copilot.lua` - GitHub Copilot via blink.cmp source (blink-copilot)
- `lua/plugins/mason.lua` - Mason LSP/tool installer config
- `lua/plugins/treesitter.lua` - Parser list + auto_install via astrocore.opts.treesitter (v6 pattern)
- `lua/plugins/yaml.lua` - yaml-companion + schemastore + yaml-folds + jsonpath
- `lua/plugins/devops.lua` - terraform, ansible, s3edit, sops, kulala (HTTP client)
- `lua/plugins/git.lua` - diffview, blame, worktree, octo (GitHub PRs)
- `lua/plugins/kubernetes.lua` - kubectl.nvim (k8s explorer)
- `lua/plugins/data.lua` - dadbod (DB), csv, log highlighting, base64
- `lua/plugins/env.lua` - dotenv + ecolog (lazy-loaded on .env files)
- `lua/plugins/productivity.lua` - overseer (task runner) + pendulum (time tracking)
- `lua/plugins/terminal.lua` - toggleterm + TUI launchers (k9s, lazygit, lazydocker, btm)
- `lazy-lock.json` - Pinned plugin versions (committed; reproducible across machines)

### DevOps which-key prefixes (see astrocore.lua)
- `<leader>k` Kubernetes (kk=kubectl, kc=ctx, kn=ns)
- `<leader>g` Git; `<leader>gO` GitHub (Octo); `<leader>gw` worktrees
- `<leader>t` Terminal TUIs (tk=k9s, tl=lazydocker, tg=lazygit, tb=btm)
- `<leader>T` Time tracking (pendulum)
- `<leader>R` REST/HTTP (kulala)
- `<leader>r` Run/Replace (overseer + rip-substitute)
- `<leader>y` YAML (ys=schema selector); `<leader>j` JSON (jp=path)
- `<leader>c` .env tools (ecolog)
- `<leader>a` AWS (aS=S3Edit)
- `<leader>x` eXtra (base64)
- `<leader>e` Edit common dotfiles (ek=kubeconfig, es=ssh, ea=aws, et=terraformrc)

## Development Commands

### Plugin Management
```bash
# Update plugins (run in Neovim)
:Lazy update

# Sync plugins with lock file
:Lazy restore

# Check plugin status
:Lazy
```

### LSP Commands
```bash
# Install/update LSP servers (in Neovim)
:Mason

# View LSP info for current buffer
:LspInfo
```

## Architecture Notes

1. **Plugin System**: Uses Lazy.nvim with AstroNvim v6 spec pattern. Plugins are defined in `lua/plugins/` as individual Lua modules returning plugin specs.

2. **LSP Configuration**: Managed through AstroLSP with Mason integration. Uses `vim.lsp.enable()` via `handlers["*"]`. Format-on-save is enabled globally except for Terraform files.

3. **Completion**: Uses `blink.cmp` (replaces `nvim-cmp` from v4). Copilot source via `blink-copilot`.

4. **Treesitter (v6)**: nvim-treesitter on `main` branch is parser-only. All highlight/indent/auto_install/ensure_installed go through `astrocore.opts.treesitter` (AstroCore v3 API). Do NOT put `ensure_installed` on the `nvim-treesitter` plugin opts — it has no effect.

5. **Language Support**: Specialized packs for Python, Terraform, Helm, JSON, YAML via AstroCommunity imports in `lua/community.lua`. User plugins layer on additional tooling (yaml-companion for schemas, vim-terraform for syntax extras).

6. **Key Customizations**:
   - GitHub Copilot with blink.cmp integration
   - Flash.nvim for enhanced navigation
   - Dracula colorscheme
   - vim options and keymaps in astrocore.lua (4-space indent, mouse support, system clipboard)

## Adding New Plugins

To add a new plugin, create a new file in `lua/plugins/` following this pattern:

```lua
---@type LazySpec
return {
  "author/plugin-name",
  config = function()
    require("plugin-name").setup({
      -- configuration options
    })
  end,
}
```

## Testing Changes

After making configuration changes:
1. Restart Neovim or run `:source %` on the changed file
2. Run `:Lazy` to ensure plugins load correctly
3. Check `:messages` for any errors
4. Test specific functionality related to your changes
