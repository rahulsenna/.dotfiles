---require('rose-pine').setup({
---    disable_background = true
---})
---require('darkplus').setup({
   --- disable_background = true
---})


function ColorMyPencils(color)
	-- color = color or "gruvbox"
	-- vim.cmd.colorscheme("gruvbox")

	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

-- ColorMyPencils()
vim.cmd("command! ColorMyPencils lua ColorMyPencils()")

-- vim.cmd("autocmd VimEnter * colorscheme gruvbox")
-- vim.cmd("autocmd VimEnter * AirlineTheme gruvbox")

vim.cmd([[
augroup set_colorscheme
  autocmd!
  " autocmd BufEnter * colorscheme gruvbox
  " autocmd BufEnter * AirlineTheme gruvbox
augroup END
]])

