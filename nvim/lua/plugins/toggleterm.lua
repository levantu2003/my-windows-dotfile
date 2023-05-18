return {
	"akinsho/toggleterm.nvim",
	name = "toggleterm",
	config = function()
		require("toggleterm").setup({
			size = 12,
			direction = "float",
			open_mapping = [[<c-\>]],
			hide_numbers = true,
			shade_terminals = false,
			shading_factor = -30,
		})
	end,
}
