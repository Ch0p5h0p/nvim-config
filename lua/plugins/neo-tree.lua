return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    opts = {},
    config = function(_, opts)
        require("neo-tree").setup(opts)

        vim.keymap.set("n","<leader>t",function() vim.cmd("Neotree toggle") end, { desc = "Toggle NeoTree", })
    end,
}
