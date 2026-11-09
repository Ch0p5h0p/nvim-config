return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        local builtin = require("telescope.builtin")

        vim.api.nvim_create_user_command(
            'ManPages',
            function(opts)
                if opts.args == '' then
                    builtin.man_pages()
                else
                    builtin.man_pages({ sections = { opts.args } })
                end
            end,
            {
                desc = "Man page browser",
                nargs = '?'
            }
        )

        vim.api.nvim_create_user_command('M', function(opts) vim.cmd("ManPages "..opts.args) end, { desc = "Alias for ManPages", nargs = '?'})
    end
}
