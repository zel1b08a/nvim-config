return {
    {
        "stevearc/aerial.nvim",
        opts = {},
        keys = {
            { "<leader>cs", "<cmd>AerialToggle<CR>", desc = "Symbols Outline" },
        },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim",
        },
    },
}
