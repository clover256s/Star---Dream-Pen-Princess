return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	config = function()
		require("ibl").setup({
			indent = { highlight = highlight, char = "│" },
			scope = { enabled = false },
		})
	end,
}
