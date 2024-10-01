return {
	{
		"tiagovla/tokyodark.nvim",
		opts = {
			-- custom options here
		},
		config = function(_, opts)
			require("tokyodark").setup(opts) -- calling setup is optional
			--vim.cmd [[colorscheme tokyodark]]
		end,
	},
	{
		'xiantang/darcula-dark.nvim',
		config = function()
			vim.cmd('colorscheme darcula-dark')
		end
	}
}
