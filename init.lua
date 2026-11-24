-- Ch0p5h0p's NeoVim config

vim.g.mapleader = " "

require("config.lazy")
require("lazy").setup("plugins")

vim.api.nvim_create_user_command('Econf', function(opts) vim.cmd("e ~/.config/nvim/init.lua") end, {desc = "Edit NeoVim config", nargs = 0})

vim.diagnostic.config({
    float = {
        border = "rounded",
        focusable = false,
        style = "minimal",
        source = "always",
        header = { "Diagnostics", "Normal" },
        prefix = " ",
    },
})

vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false, scope = "cursor" })
  end,
})

vim.o.updatetime = 300

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

vim.keymap.set("n", "]g", vim.diagnostic.goto_next, { desc = "Go to next error" })
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, { desc = "Go to previous error" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show line error" })
vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, { desc = "Show info about the object under the cursor" })

vim.keymap.set("n", "<leader>vs", "<C-w>v", { desc = "Split window vertically" })

vim.keymap.set("n", "fs", function()
    vim.ui.input({ prompt = "Enter filetype to change to: " }, function(input)
        if input then
            vim.cmd("set filetype="..input)
        end
    end)
end, { desc = "Change buffer filetype" })

vim.keymap.set('v', '<C-Insert>', '"+y')
vim.keymap.set('n', '<C-Insert>', '"+y$')

vim.keymap.set('n', '<leader>r', function() vim.cmd("Ranger") end, { desc = "Open Ranger" })

vim.keymap.set({'n', 'v'}, 'x', '"_x', { noremap = true })
vim.keymap.set({'n', 'v'}, 'X', '"_X', { noremap = true })

vim.opt.termguicolors = true

vim.opt.wrap = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.cursorline = false
vim.opt.number = true
vim.opt.relativenumber = true

--vim.cmd.colorscheme "catppuccin-nvim"
vim.opt.background = "dark"
vim.cmd.colorscheme "coffeehouse"

-- start each empty file with a randomly selected comment
local messages_file = vim.fn.stdpath("config") .. "/scratch-messages"

if vim.fn.filereadable(messages_file) ~= 1 then
    vim.fn.writefile({"PLEASE put something in "..messages_file}, messages_file)
end

local function random_message()
    local messages = vim.fn.readfile(messages_file)

    if #messages == 0 then
        return "PLEASE put something in "..messages_file
    end

    return messages[math.random(#messages)]
end

local group = vim.api.nvim_create_augroup("NewFileTemplate", {
    clear = true,
})

vim.api.nvim_create_autocmd("BufNewFile", {
    group = group,
    pattern = "*",
    callback = function()
        local commentstring = vim.bo.commentstring

        if commentstring == "" then
            return
        end

        local message = random_message()
        local comment = commentstring:format(" " .. message)

        vim.api.nvim_buf_set_lines(0, 0, -1, false, {
            comment,
            "",
        })
    end,
})

function cd_to_proj_root()
    local dir = vim.fn.expand("%:p:h")

    if dir == "" then
        dir = vim.fn.getcwd()
    end

    local git_root = vim.fs.find(
        { ".git" },
        {
            path = dir,
            upward = true,
            type = "directory",
        }
    )[1]

    if git_root then
        vim.cmd.cd(vim.fs.dirname(git_root))
    else
        vim.cmd.cd(dir)
    end
end

vim.api.nvim_create_user_command('Cdr', cd_to_proj_root, {desc = "cd to project root", nargs = 0})

cd_to_proj_root()
