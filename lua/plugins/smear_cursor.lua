require("smear_cursor").setup({
    opts = {
        smear_between_buffers = true,
        smear_between_neighbor_lines = true,
        smear_insert_mode = true,

        -- make the trail white (hex or highlight group name)
        cursor_color = "#ffffff",
    },
})
