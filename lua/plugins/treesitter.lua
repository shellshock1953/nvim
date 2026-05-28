-- Treesitter in v6: nvim-treesitter is now just a parser download utility.
-- Highlighting, folding, and textobjects are configured via AstroCore.

---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "python",
        "terraform",
        "hcl",
        "yaml",
        "json",
        "dockerfile",
        "bash",
        "markdown",
        "markdown_inline",
        "helm",
        "go",
      },
    },
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      treesitter = {
        highlight = true,
        indent = true,
        autotag = false,
      },
    },
  },
}
