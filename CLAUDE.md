# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Neovim Configuration Overview

This is an **AstroNvim v4+** based Neovim configuration that uses Lazy.nvim for plugin management. The configuration follows AstroNvim's modular Lua architecture.

## Key Files and Structure

### Core Configuration
- `init.lua` - Entry point that bootstraps Lazy.nvim
- `lua/lazy_setup.lua` - Lazy.nvim configuration and plugin loading
- `lua/community.lua` - AstroCommunity plugin imports
- `lua/plugins/` - Individual plugin configurations

### Important Plugin Files
- `lua/plugins/user.lua` - Core vim options and UI settings
- `lua/plugins/astrolsp.lua` - LSP configuration (format on save, keymaps)
- `lua/plugins/copilot.lua` - GitHub Copilot integration with CMP
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

### Linting
The configuration uses Selene for Lua linting:
```bash
# Install selene (if not installed)
cargo install selene

# Run linter
selene lua/
```

## Architecture Notes

1. **Plugin System**: Uses Lazy.nvim with AstroNvim's spec pattern. Plugins are defined in `lua/plugins/` as individual Lua modules returning plugin specs.

2. **LSP Configuration**: Managed through AstroLSP with Mason integration. Format-on-save is enabled globally except for Terraform files.

3. **Disabled Components**: Several default AstroNvim components are intentionally disabled (astrocore.lua, mason.lua, treesitter.lua) - check for `if true then return {} end` pattern before modifying.

4. **Language Support**: Includes specialized packs for Python, Terraform, Helm, Docker, JSON, YAML via AstroCommunity imports.

5. **Key Customizations**:
   - GitHub Copilot with CMP integration
   - Flash.nvim for enhanced navigation
   - Dracula colorscheme
   - Custom vim options in user.lua (4-space indent, mouse support, system clipboard)

## Adding New Plugins

To add a new plugin, create a new file in `lua/plugins/` following this pattern:

```lua
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