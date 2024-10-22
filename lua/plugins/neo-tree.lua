-- return {
-- { "nvim-neo-tree/neo-tree.nvim",
--     config = function ()
--         require("neo-tree").setup({
--             -- filesystem = {
--             --     follow_current_file = {
--             --         enabled = true,
--             --         leave_dirs_open = false,
--             --   },
--             -- },
--             window = {
--               mappings = {
--                 ["S"] = "split_with_window_picker",
--                 ["s"] = "vsplit_with_window_picker",
--                },
--             }
--
--         })
--     end,
--   },
-- }

return {
  "nvim-neo-tree/neo-tree.nvim",

  opts = {
    sources = { "filesystem", "buffers", "git_status", "document_symbols" },
    open_files_do_not_replace_types = {
      "terminal",
      "Trouble",
      "trouble",
      "qf",
      "Outline",
    },
    filesystem = {
      bind_to_cwd = true,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,

      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          ".git",
          ".DS_Store",
          "thumbs.db",
        },
        never_show = {},
      },
    },
    window = {
      mappings = {
        ["S"] = "split_with_window_picker",
        ["s"] = "vsplit_with_window_picker",
        ["<space>"] = "none",
        ["Y"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
          end,
          desc = "Copy Path to Clipboard",
        },
        ["O"] = {
          function(state)
            require("lazy.util").open(
              state.tree:get_node().path,
              { system = true }
            )
          end,
          desc = "Open with System Application",
        },
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
    },
  },
}

