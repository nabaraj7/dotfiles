vim.pack.add({
    "https://github.com/akinsho/bufferline.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
})

require("bufferline").setup({
    options = {
        mode = "buffers",
        show_buffer_close_icons = true,
        show_close_icon = false,
        separator_style = "slant",
        always_show_bufferline = true,
        offsets = {
            {
                filetype = "minifiles",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left",
            },
        },
    },
})
