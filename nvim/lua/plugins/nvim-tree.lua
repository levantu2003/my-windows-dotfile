return {
    "nvim-tree/nvim-tree.lua",
    name = "nvim-tree",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        name = "icons",
    },
    config = function()
        require("nvim-tree").setup({})
    end,
}
