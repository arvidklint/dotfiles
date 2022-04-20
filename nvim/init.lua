local utils = require("config.utils")

vim.g.mapleader = " "

function _G.dump(...)
	local objects = vim.tbl_map(vim.inspect, { ... })
	print(unpack(objects))
end

local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local map = utils.map

-- Bootstrap packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	Packer_Bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

local packer = require("packer")
local use = packer.use
packer.startup(function()
	use({ "wbthomason/packer.nvim" })

	-- colorschemes
	-- use({ "sainnhe/everforest", opt = true })
	-- use({
	-- 	"ellisonleao/gruvbox.nvim",
	-- 	requires = { "rktjmp/lush.nvim" },
	-- 	opt = true,
	-- })
	-- use({ "mangeshrex/everblush.vim" })
	-- use({ "jacoborus/tender.vim", opt = true })
	-- use({ "srcery-colors/srcery-vim", opt = true })
	use({ "folke/tokyonight.nvim" })
	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = require("config.treesitter").config,
	})

	-- Language Server Protocol (LSP)
	use({
		"neovim/nvim-lspconfig",
		config = require("config.lsp").config,
	})
	use({
		"williamboman/nvim-lsp-installer",
	})
	use({
		"ray-x/lsp_signature.nvim",
	})

	use({
		"folke/trouble.nvim",
		config = function()
			require("config.trouble").config()
		end,
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	use({ "tami5/lspsaga.nvim" })
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-cmdline" },
			{ "onsails/lspkind-nvim" },
			{ "saadparwaiz1/cmp_luasnip" },
		},
		config = function()
			require("config.nvim_cmp").config()
		end,
	})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("config.telescope").setup()
			require("config.telescope").config()
		end,
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
	})

	use({
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("config.gps").config()
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		requires = { { "kyazdani42/nvim-web-devicons", opt = true }, { "SmiteshP/nvim-gps" } },
		config = function()
			require("config.statusline").config()
		end,
	})

	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("config.nvim_tree").setup()
		end,
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use({
		"TimUntersberger/neogit",
		requires = { { "nvim-lua/plenary.nvim" }, { "sindrets/diffview.nvim" } },
		config = function()
			require("config.neogit").config()
		end,
	})
	use({
		"sindrets/diffview.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = require("config.gitsigns").setup,
		requires = { "nvim-lua/plenary.nvim" },
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})

	use({
		"mhinz/vim-startify",
		config = function()
			require("config.startify").config()
		end,
	})

	use("editorconfig/editorconfig-vim")

	use({
		"phaazon/hop.nvim",
		as = "hop",
		config = function()
			require("config.hop").config()
		end,
	})

	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
	})

	use({
		"mfussenegger/nvim-dap",
		config = function()
			require("config.dap").config()
		end,
	})

	use({
		"L3MON4D3/LuaSnip",
	})

	use({
		"AckslD/nvim-neoclip.lua",
		requires = { { "nvim-telescope/telescope.nvim" } },
		config = function()
			require("config.neoclip").setup()
		end,
	})

	use({ "sbdchd/neoformat", config = require("config.neoformat").config })

	if Packer_Bootstrap then
		require("packer").sync()
	end
end)

-- automatically remove trailing whitespace on save
require("trim-whitespace")()

local set = vim.opt

set.termguicolors = true
vim.g.everforest_background = "hard"
vim.g.everforest_sign_column_background = "none"
vim.g.everforest_ui_contrast = "high"
vim.g.everforest_show_eob = false
set.background = "dark"

vim.g.gruvbox_contrast_dark = "hard"

vim.g.tokyonight_style = "night"

cmd("colorscheme catppuccin")

set.number = true
-- set.relativenumber = true

set.inccommand = "nosplit"
set.incsearch = true
set.ignorecase = true -- Ignore case
set.smartcase = true -- Don't ignore case with capitals
set.wrapscan = true -- Search wraps at end of file
set.scrolloff = 4 -- Lines of context
set.wrap = false

set.hidden = true -- Enable modified buffers in background
set.splitbelow = true -- Put new windows below current
set.splitright = true -- Put new windows right of currentset hidden

set.swapfile = false
set.backup = false
set.writebackup = false

if fn.isdirectory(vim.o.undodir) == 0 then
	fn.mkdir(vim.o.undodir, "p")
end
set.undofile = true -- Save undo history
set.confirm = true -- prompt to save before destructive actions

set.wildignore = utils.add_to_table({
	"*.aux,*.out,*.toc",
	"*.o,*.obj,*.dll,*.jar,*.pyc,*.rbc,*.class",
	"*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp",
	"*.avi,*.m4a,*.mp3,*.oga,*.ogg,*.wav,*.webm",
	"*.eot,*.otf,*.ttf,*.woff",
	"*.doc,*.pdf",
	"*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz",
	-- Cache
	"*/node_modules/*",
	".sass-cache",
	"*/vendor/gems/*,*/vendor/cache/*",
	"*/.bundle/*,*.gem",
	-- Temp/System
	"*.*~,*~ ",
	"*.swp,.lock,.DS_Store,._*,tags.lock",
})

set.autoindent = true -- Allow filetype plugins and syntax highlighting
set.expandtab = true -- Use spaces instead of tabs
set.shiftwidth = 2 -- Size of an indent
set.smartindent = true -- Insert indents automatically
set.tabstop = 2 -- Number of spaces tabs count for
set.softtabstop = 2
-- set.shiftround = true -- Round indent
set.joinspaces = false -- No double spaces with join after a dotset

set.clipboard = "unnamedplus"
set.signcolumn = "yes"

set.completeopt = "menu,menuone,noselect" -- Completion options
set.pumheight = 10

set.cmdheight = 2
set.cursorline = true -- highlight current line

-- Mappings

-- Reload config
map("n", "<leader>rc", ':lua require("config.utils").reload_config()<CR>')

-- Move selected line / block of text in visual mode
-- shift + k to move up
-- shift + j to move down
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "J", ":move '>+1<CR>gv-gv")

-- Change windows with ctrl-hjkl
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<left>", "<C-w>h")
map("n", "<down>", "<C-w>j")
map("n", "<up>", "<C-w>k")
map("n", "<right>", "<C-w>l")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("n", "<Leader>s", ":%s/<C-r><C-w>//g<Left><Left>")

-- map('i', '<Tab>', 'pumvisible() ? "<C-n>" : "<Tab>"', { expr = true })
-- map('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', { expr = true })
map("i", "<C-j>", 'pumvisible() ? "<C-n>" : "<C-j>"', { expr = true })
map("i", "<C-k>", 'pumvisible() ? "<C-p>" : "<C-k>"', { expr = true })

map("n", "<leader>l", "<cmd>noh<CR>") -- Clear highlights
map("n", "<leader>o", "m`o<Esc>``") -- Insert a newline in normal mode
map("n", "<leader>O", "m`O<Esc>``") -- Insert a newline in normal mode

cmd(":command! WQ wq")
cmd(":command! Wq wq")
cmd(":command! W w")
cmd(":command! Q q")

cmd("au TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false}")

-- cmd [[au CursorHold * :exec 'match Search /\V\<' . expand('<cword>') . '\>/']]
-- set.updatetime=500

-- Set filetypes
cmd([[au BufNewFile,BufRead *.ts setlocal filetype=typescript]])
cmd([[au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx]])
cmd([[au BufNewFile,BufRead *.jsx setlocal filetype=javascript.jsx]])
