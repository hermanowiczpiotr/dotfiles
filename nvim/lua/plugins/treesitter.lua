
return {
  -- Treesitter configuration
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",  -- Automatically updates Treesitter parsers
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "go", "lua", "javascript", "python" }, -- List of parsers you want installed
        highlight = {
          enable = true, -- Enable Treesitter-based syntax highlighting
        },
        indent = {
          enable = true, -- Enable Treesitter-based indentation (optional)
        },
        autopairs = {
          enable = true, -- Enable Treesitter-based autopairs (optional)
        },
      })
    end,
  },
  
  -- Add more plugins if you need them
}
