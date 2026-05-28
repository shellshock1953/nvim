-- Treesitter in v6: nvim-treesitter is just a parser-download utility.
-- All highlight/indent/textobject configuration goes through AstroCore.
---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      treesitter = {
        highlight = true,
        indent = true,
        auto_install = true, -- auto-install parsers for opened buffers (and injection langs)
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "query",
          "regex", -- used by many injection queries
          "comment", -- used by yaml/json injections
          "python",
          "terraform",
          "hcl",
          "yaml",
          "json",
          "jsonc",
          "dockerfile",
          "bash",
          "markdown",
          "markdown_inline",
          "helm",
          "gotmpl", -- parent of helm injection
          "go",
          "diff",
          "git_config",
          "git_rebase",
          "gitcommit",
          "gitignore",
          "gitattributes",
          "html",
          "css",
          "toml",
          "ini",
          "sql",
        },
      },
    },
  },
}
