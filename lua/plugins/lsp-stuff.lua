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
        "williamboman/mason.nvim",
        opts = {},
    },

    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "clangd",
                "jdtls",
                "rust_analyzer",
                "pyright",
                "asm_lsp",
                --"hls",
            },
        },
    },
}
