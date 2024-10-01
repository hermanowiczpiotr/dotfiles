return {
	{
		'tpope/vim-fugitive',
    		cmd = { 'Git', 'G' }, -- Optional: Lazy-load on these commands
    		event = 'BufRead',    -- Optional: Load on buffer read
    		config = function()
      		-- Optional: Add any configuration or keybindings here
    		end,
	}
}
