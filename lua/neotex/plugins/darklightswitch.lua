return {
	{
		"terrortylor/nvim-comment",
		config = function()
			require("darklight").setup({
				mode = "colorscheme",
				light_mode_colorscheme = "quiet",
				dark_mode_colorscheme = "gruvbox",
			})
		end,
	},

	{
		"eliseshaffer/darklight.nvim",
		config = function()
			require("nvim_comment").setup({ create_mappings = false })
		end,
	},
  {
		"vimwiki/vimwiki",
	},
}
