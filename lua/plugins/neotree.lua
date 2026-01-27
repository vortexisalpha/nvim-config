require("neo-tree").setup({
    close_if_last_window = true,
    filesystem = {
        hijack_netrw_behavior = "open_current",
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
        },
        follow_current_file = {
            enabled = true,
        },
    },
    window = {
        position = "left",
        width = 30,
        mappings = {
            ["l"] = "open",
            ["h"] = "close_node",
            ["H"] = "navigate_up",
            ["L"] = "navigate_down"
        }
    },
})

