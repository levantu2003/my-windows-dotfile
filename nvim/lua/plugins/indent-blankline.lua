return {
    "lukas-reineke/indent-blankline.nvim",
    name = "indent-blankline",
    config = function()
        require("indent_blankline").setup({
            show_end_of_line = true,
        })
    end,
}
