return {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
        highlights = {
            fill = {
                bg = "#181825",
            },
            background = {
                bg = "#181825",
            },
            buffer_selected = {
                bg = "#313244",
            },

            close_button = {
                bg = "#181825",
            },
            close_button_visible = {
                bg = "#181825",
            },
            close_button_selected = {
                bg = "#313244",
            },
        },
    },
    config = function(_, opts)
        require("bufferline").setup(opts)

        vim.keymap.set("n","<C-PageDown>", function() vim.cmd("BufferLineCycleNext") end, { desc = "next buffer", })
        vim.keymap.set("n", "<C-PageUp>", function() vim.cmd("BufferLineCyclePrev") end, { desc = "previous buffer", })
    end,
}
