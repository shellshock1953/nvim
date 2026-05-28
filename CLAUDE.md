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
- `lua/plugins/astrocore.lua` - Core vim options, keymaps, and features
- `lua/plugins/astrolsp.lua` - LSP configuration (format on save, keymaps)
- `lua/plugins/copilot.lua` - GitHub Copilot with blink.cmp integration
- `lua/plugins/mason.lua` - Mason LSP/tool installer config
- `lua/plugins/treesitter.lua` - Treesitter parsers and astrocore integration
- `lazy-lock.json` - Pinned plugin versions (do not edit manually)

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

4. **Treesitter**: nvim-treesitter v2 (parser-only); highlight/indent opts configured via astrocore opts.

5. **Language Support**: Includes specialized packs for Python, Terraform, Helm, Docker, JSON, YAML via AstroCommunity imports.

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
