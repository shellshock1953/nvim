return {
{ "nvim-neo-tree/neo-tree.nvim",
    config = function ()
        require("neo-tree").setup({
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
