vim.keymap.set('n', '<C-f>', ':NERDTreeFocus<CR>', {noremap = true})
vim.keymap.set('n', '<C-n>', ':NERDTree<CR>', {noremap = true})
vim.keymap.set('n', '<C-t>', ':NERDTreeToggle<CR>', {noremap = true})
vim.keymap.set('n', '<C-l>', ':call CocActionAsync("jumpDefinition")<CR>', {noremap = true})

vim.keymap.set('n', '<F8>', ':TagbarToggle<CR>', {noremap = true})

vim.cmd("set completeopt-=preview") -- For No Previews

vim.g.NERDTreeDirArrowExpandable = "+"
vim.g.NERDTreeDirArrowCollapsible = "~"

