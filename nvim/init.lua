vim.g.mapleader = "\\"
require("config.lazy")
require 'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
}
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require('go.format').goimports()
	end,
	group = format_sync_grp,
})
require('go').setup()
--vim.cmd.colorscheme "catppuccin"
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true


-- OR setup with some options
require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
	on_attach = function(bufnr)
		local api = require('nvim-tree.api')

		-- Check if api.node.open.vertical and other functions exist before setting key mappings
		if api and api.node and api.node.open and api.node.open.vertical then
			vim.keymap.set('n', 'v', api.node.open.vertical,
				{ buffer = bufnr, noremap = true, silent = true })
		end

		if api and api.node and api.node.open and api.node.open.horizontal then
			vim.keymap.set('n', 's', api.node.open.horizontal,
				{ buffer = bufnr, noremap = true, silent = true })
		end

		if api and api.node and api.node.open and api.node.open.edit then
			vim.keymap.set('n', '<CR>', api.node.open.edit, { buffer = bufnr, noremap = true, silent = true })
			vim.keymap.set('n', 'o', api.node.open.edit, { buffer = bufnr, noremap = true, silent = true })
		end
		vim.keymap.set('n', 'd', api.fs.remove, { buffer = bufnr, noremap = true, silent = true })

		--    if api and api.fs and api.fs.create then
		--    vim.keymap.set('n', 'a', api.fs.create, { buffer = bufnr, noremap = true, silent = true })
		-- end
	end
})
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true }) -- Toggle explorervim
vim.api.nvim_set_keymap('n', '<leader>c', ':NvimTreeClose<CR>', { noremap = true, silent = true })  -- Close explorervim
-- OR setup with some options
require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
	on_attach = function(bufnr)
		local api = require('nvim-tree.api')

		-- Check if api.node.open.vertical and other functions exist before setting key mappings
		if api and api.node and api.node.open and api.node.open.vertical then
			vim.keymap.set('n', 'v', api.node.open.vertical,
				{ buffer = bufnr, noremap = true, silent = true })
		end

		if api and api.node and api.node.open and api.node.open.horizontal then
			vim.keymap.set('n', 's', api.node.open.horizontal,
				{ buffer = bufnr, noremap = true, silent = true })
		end

		if api and api.node and api.node.open and api.node.open.edit then
			vim.keymap.set('n', '<CR>', api.node.open.edit, { buffer = bufnr, noremap = true, silent = true })
			vim.keymap.set('n', 'o', api.node.open.edit, { buffer = bufnr, noremap = true, silent = true })
		end

		if api and api.fs and api.fs.create then
			vim.keymap.set('n', 'a', api.fs.create, { buffer = bufnr, noremap = true, silent = true })
		end
		vim.keymap.set('n', 'd', api.fs.remove, { buffer = bufnr, noremap = true, silent = true })
	end
})
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true }) -- Toggle explorervim
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFocus<CR>', { noremap = true, silent = true })  -- Focus on explorer
vim.api.nvim_set_keymap('n', '<leader>c', ':NvimTreeClose<CR>', { noremap = true, silent = true })  -- Close explorervim


require 'navigator'.setup()

require 'lspconfig'.gopls.setup {

	settings = {
		gopls = {
			-- Automatyczne dodawanie brakujących importów
			completeUnimported = true,
		}
	}
}
require 'lspconfig'.lua_ls.setup {}
require('lualine').setup {
	sections = {
		lualine_c = {
			{ 'filename', path = 1 }, -- Show relative path
		},
	},
}
