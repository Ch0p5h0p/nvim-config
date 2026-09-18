return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                --lua = { "stylua" },
                --python = { "isort", "black" },
                rust = { "rustfmt" },
                nix = { "nixfmt" },
            }
        })
        
        vim.keymap.set({"n", "v"}, "<leader>F", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            })
        end, { desc = "Format file" })
    end
}
