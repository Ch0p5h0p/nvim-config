return { 
    "catppuccin/nvim", 
    enabled = true,
    name = "catppuccin", 
    priority = 1000, 
    config = function(_, opts)
        require("catppuccin").setup({
            flavour = "mocha",
            transparent_background = true,
            auto_integrations = true,
            custom_highlights = function(colors)
                return {
                    LineNr = { fg = colors.lavender },
                    CursorLineNr = { fg = colors.peach },
                    --CursorLine = { bg = "#2d2d2d" },
                }
            end
        })
        vim.cmd.colorscheme("catppuccin-nvim")
    end,
}
