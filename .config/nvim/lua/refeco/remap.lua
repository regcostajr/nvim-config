vim.g.mapleader = " "
-- move selected lines into text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor at the beginning of the line while crop last character
vim.keymap.set("n", "J", "mzJ`z")

-- replace cursor text by
vim.keymap.set("n", "<C-s>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- select word
vim.keymap.set("n", "<C-l>", "<esc>viw")

-- select all
vim.keymap.set("n", "<C-a>", "<esc>ggVG<CR>")

--telescope
vim.keymap.set('n', '<C-p>', "<cmd>Telescope find_files<CR>")
vim.keymap.set('n', '<C-p>f', "<cmd>Telescope git_files<CR>")
vim.keymap.set('n', '<C-b>', "<cmd>Telescope buffers<CR>")

--gitsigss
vim.keymap.set('n', '<C-h>', '<cmd>Gitsigns preview_hunk<CR>')
vim.keymap.set('n', '<C-h>r', '<cmd>Gitsigns reset_hunk<CR>')

--easymotion
vim.keymap.set('n', 's', '<Plug>(easymotion-s)')

vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format({ async = true })
end)

vim.keymap.set("n", "<F5>", Run)
vim.keymap.set("n", "<F6>", Debug)

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>n', vim.diagnostic.goto_next)
