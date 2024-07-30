return {
{ "nvim-neo-tree/neo-tree.nvim",
    config = function ()
        require("neo-tree").setup({
            filesystem = {
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = false,
              },
            },
            window = {
              mappings = {
                ["S"] = "split_with_window_picker",
                ["s"] = "vsplit_with_window_picker",
               },
            }

        })
    end,
  },
}
