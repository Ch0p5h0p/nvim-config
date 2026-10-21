return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config("jdtls", {
                settings = {
                    java = {},
                },
            })

            vim.lsp.config("supercollider", {
                cmd = { "sclang", "-i", "vscode" },
                filetypes = { "supercollider" },
                root_markers = { ".git" },
            })

            vim.lsp.enable({
                "jdtls",
                "clangd",
                "rust_analyzer",
                "pyright",
                "nil",
                "asm_lsp",
                "hls",
                "ocamllsp",
                "supercollider",
            })
        end,
    },

    {
        "mason-org/mason.nvim",
        opts = {},
    },

    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "clangd",
                "jdtls",
                "rust_analyzer",
                "pyright",
                "asm_lsp",
            },
            automatic_enable = false,
        },
    },
}
