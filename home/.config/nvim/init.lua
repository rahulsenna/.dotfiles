
------------------------------Packer---------------------------------------



-- Load packer.nvim
local packer = require('packer')

-- Initialize the plugin manager
packer.init({
  -- Optional: Specify the path where plugins will be installed
  -- By default, it uses `~/.local/share/nvim/site/pack/packer/start`
  -- install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start'
})

packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  

  use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})
  use("nvim-treesitter/playground")
  use("theprimeagen/harpoon")
  use("theprimeagen/refactoring.nvim")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")
  use("nvim-treesitter/nvim-treesitter-context");

  -- use {
	 --  'VonHeikemen/lsp-zero.nvim',
	 --  branch = 'v1.x',
	 --  requires = {
		--   -- LSP Support
		--   {'neovim/nvim-lspconfig'},
		--   {'williamboman/mason.nvim'},
		--   {'williamboman/mason-lspconfig.nvim'},
  --
		--   -- Autocompletion
		--   {'hrsh7th/nvim-cmp'},
		--   {'hrsh7th/cmp-buffer'},
		--   {'hrsh7th/cmp-path'},
		--   {'saadparwaiz1/cmp_luasnip'},
		--   {'hrsh7th/cmp-nvim-lsp'},
		--   {'hrsh7th/cmp-nvim-lua'},
  --
		--   -- Snippets
		--   {'L3MON4D3/LuaSnip'},
		--   {'rafamadriz/friendly-snippets'},
	 --  }
  -- }

  use("folke/zen-mode.nvim")
  --use("github/copilot.vim")
  use("eandrju/cellular-automaton.nvim")
  use("laytan/cloak.nvim")

  --use('vim-airline/vim-airline')
  --use('vim-airline/vim-airline-themes')
  use("morhetz/gruvbox")


  use('honza/vim-snippets')
  use('http://github.com/tpope/vim-surround') -- Surrounding ysw)
  use('https://github.com/preservim/nerdtree') -- NerdTree
  use('numToStr/Comment.nvim') -- For Commenting gcc & gc
  use('https://github.com/lifepillar/pgsql.vim') -- PSQL Pluging needs :SQLSetType pgsql.vim
  use('https://github.com/ap/vim-css-color') -- CSS Color Preview
  use('https://github.com/rafi/awesome-vim-colorschemes') -- Retro Scheme
  use('https://github.com/ryanoasis/vim-devicons') -- Developer Icons
  use('https://github.com/tc50cal/vim-terminal') -- Vim Terminal
  use('https://github.com/preservim/tagbar') -- Tagbar for code navigation
  use('https://github.com/terryma/vim-multiple-cursors') -- CTRL + N for multiple cursors

  use('https://github.com/dstein64/vim-startuptime')

  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-buffer')


end)


--- Optional: Automatically run `:PackerInstall` on the first run or when plugins are missing
-- packer.install()

-- Optional: Automatically run `:PackerSync` whenever the configuration is updated
-- packer.sync()


-- Set up nvim-cmp.
--[[ local cmp = require('cmp')

cmp.setup({
   snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<S-Space>'] = cmp.mapping.complete(),
        ['ý'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources(
    {
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, 
    {
        { name = 'buffer' },
    })
 
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- cmp.autocomplete = false
-- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    -- capabilities = capabilities
-- }
cmp.setup {
    -- mapping = {
    --     ['<C-Space>'] = cmp.mapping.complete({
    --         config = {
    --             sources = {
    --                 { name = 'buffer' }
    --             }
    --         }
    --     })
    -- },
    completion = {
      -- autocomplete = false
    }
} 
 ]]
-----------------------------------------------------



------------------------------Packer END-----------------------------------














------------------------------Settings---------------------------------------

vim.o.guifont = 'Monolisa:h13'
vim.cmd("filetype plugin indent on")

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- Enable true-color support
-- vim.env.TERM = 'xterm-256color'
-- Set the TERM environment variable
-- vim.o.termguicolors = true
--vim.opt.colorcolumn = "80"

vim.opt.completeopt=longest,menuone
-- vim.o.wildmenu = true
-- vim.opt.completeopt=menu,preview,menuone,noselect           ;
vim.api.nvim_set_option('wildmenu', true)
vim.api.nvim_set_option('ignorecase', true)
vim.api.nvim_set_option('wildoptions', 'fuzzy')
-- vim.cmd("autocmd VimEnter * colorscheme gruvbox")
-- vim.cmd("autocmd VimEnter * AirlineTheme gruvbox")


-- air-line
vim.g.airline_powerline_fonts = 1



-- Restore cursor position when reopening a file
vim.cmd([[
augroup restore_cursor_position
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
augroup END
]])

------------------------------Settings-END--------------------------------------











-----------------------------KeyBindings---------------------------------------

-- Primagen's mappings 

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-k>", "<C-d>zz")
vim.keymap.set("n", "<C-i>", "<C-u>zz")
vim.keymap.set("n", "", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-l>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/init.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader>r", function()
    vim.cmd("so")
end)


---------------------my KeyBindings---------------------------------------


-------------------IJKL-----------------------------
vim.keymap.set({'n','v'}, 'h', 'i', {noremap = true})
vim.keymap.set({'n','v'}, 'i', 'k', {noremap = true})
vim.keymap.set({'n','v'}, 'k', 'j', {noremap = true})
vim.keymap.set({'n','v'}, 'j', 'h', {noremap = true})

vim.keymap.set({'n','v'}, 'u', '^', {noremap = true})
vim.keymap.set({'n','v'}, 'o', '$', {noremap = true})
vim.keymap.set({'n','v'}, '<leader>o', 'o', {noremap = true})

vim.keymap.set('n', 'z', 'u', {noremap = true})


vim.keymap.set('n', 'g', 'v', {noremap = false})
vim.keymap.set('n', 'v', 'p', {noremap = false})
vim.keymap.set('n', 'x', 'dd', {noremap = true})
vim.keymap.set('n', 'c', 'yy', {noremap = true})


-- vim.keymap('v', 'w', 'y/\\V<C-R>=escape(@",'/)<CR><CR>Ncgn', { noremap = true })
-- vim.keymap('v', 'w', 'y/\\V' .. vim.fn.escape(vim.fn.getreg('"'), '/\\') .. '<CR><CR>Ncgn', { silent = true })
-- vim.keymap('n', '<leader>w', 'yiw:%s/' .. vim.fn.getreg('0') .. '/' , { silent = true })

vim.cmd([[
vnoremap <leader>w  y:s/<C-R>=escape(@",'/')<CR>/
nnoremap <leader>w yiw:s/<C-R>=escape(@",'/')<CR>/
vnoremap / y:s/<C-R>=escape(@",'/')<CR>/

]])
vim.keymap.set({'n','v'}, '<leader><leader>', '@:', {noremap = true});


-- vim.keymap.set('v', '/', '[[y:s/<C-R>=escape(@",'/')<CR>/]]', {noremap = true})





vim.keymap.set('n', '<C-q>', ':q!<CR>', {noremap = true})
vim.keymap.set('i', '<C-q>', '<Esc>:q!<CR>', {noremap = true})
vim.keymap.set('v', '<C-q>', ':q!<CR>', {noremap = true})

vim.keymap.set('n', '<C-s>', ':w<CR>', {noremap = true})
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>', {noremap = true})
vim.keymap.set('v', '<C-s>', ':w<CR>', {noremap = true})

vim.keymap.set('n', '<c-_>', '<plug>(comment_toggle_linewise_current)', {noremap = true})
vim.keymap.set('v', '<c-_>', '<plug>(comment_toggle_linewise_visual)', {noremap = true})
vim.keymap.set('v', 'þ', '<plug>(comment_toggle_blockwise_visual)', {noremap = true})
vim.keymap.set('i', '', '<Esc><plug>(comment_toggle_linewise_current)', {noremap = true})

vim.keymap.set({"n", "v"}, '<leader>y', '"+y', {noremap = true})
vim.keymap.set('n', '<leader>Y', '"+yg_', {noremap = true})
vim.keymap.set('n', '<leader>yy', '"+yy', {noremap = true})

vim.keymap.set('n', '<leader>p', '"+p', {noremap = true})
vim.keymap.set('n', '<leader>P', '"+P', {noremap = true})
vim.keymap.set('v', '<leader>p', '"+p', {noremap = true})
vim.keymap.set('v', '<leader>P', '"+P', {noremap = true})

vim.keymap.set('n', '<leader>cw', 'viwc', {noremap = true})


vim.keymap.set('n', '<leader>cw', 'viwc', {noremap = true})
-- vim.keymap.set('i', '<tab>', '<C-P>', {noremap = true})
vim.keymap.set('n', 'w', 'viw', {noremap = true})



vim.keymap.set('n', '<leader>j', '<C-w>h', {noremap = true});
vim.keymap.set('n', '<leader>l', '<C-w>l', {noremap = true});
-----------------------------KeyBindings-END--------------------------------------


















------------------------------My Functons-----------------------------------------



-- local function build_and_run_cpp(filename)
--   local command = "terminal g++ " .. filename .. " -o output && ./output"

--   -- Create a new vertical split
--   vim.cmd("vnew")

--   -- Run the command in a terminal buffer
--   -- vim.fn.termopen(command)
--   vim.cmd(command)
-- end

-- vim.cmd([[
-- command! -nargs=1 BuildAndRunCpp lua build_and_run_cpp(<f-args>)

-- nnoremap <F5> :BuildAndRunCpp %<CR>
-- ]])


vim.keymap.set({'v', 'n'}, '<F5>', ':w<CR> :make build-run-clean<CR>', {noremap = true})
vim.cmd([[
autocmd VimEnter *.cpp nnoremap <F8> :w<CR>:!clear; g++ --std=c++17 %; if [ -f a.out ]; then time ./a.out; rm a.out; fi<CR>
]])

   
function _G.is_cursor_at_non_white_space()
  local line = vim.api.nvim_get_current_line()
  local col = vim.fn.col('.')-1

  -- Check if the character at the cursor position is non-whitespace
  local char = vim.fn.strpart(line, col - 1, 1)
  if vim.fn.strlen(char) > 0 and char ~= ' ' then
      return true
  else
      return false
  end
end


        
-- Map TAB to trigger auto completion or enter a tab
vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.is_cursor_at_non_white_space() ? "\\<C-p>" : "\\<Tab>"', { expr = true, noremap = true, silent = true});
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.is_cursor_at_non_white_space() ? "\\<C-n>" : "\\<C-d>"', { expr = true, noremap = true, silent = true})
-- vim.api.nvim_set_keymap('i', '<Tab>', "<Cmd>lua require('cmp').complete()<CR>", { silent = true })
vim.api.nvim_set_keymap('i', '<C-o>', "<Cmd>lua require('cmp').complete()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<C-S-Return>', '<CR>{<CR>}<UP><CR>', { noremap = true })
vim.api.nvim_set_keymap('i', 'ÿ', '<CR>{<CR>}<UP><CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<S>', 'a', { noremap = true })
vim.keymap.set({"n", "i"}, '<C-z>', '<Esc>u', {noremap = true})




------------------------------My Functons--END-----------------------------------

