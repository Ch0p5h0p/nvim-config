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
                nasm = { "alignasm" }, -- used to be nasmfmt
            },
            formatters = {
                alignasm = {
                    command = "alignasm",
                    stdin = true,
                },
                --[[nasmfmt = {
                    command = "nasmfmt",
                    args = { "-ii", "4", "-ci", "40", "-" },
                    stdin = true,
                },]]
            },
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
