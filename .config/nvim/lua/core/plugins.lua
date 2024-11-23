local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
            'MunifTanjim/nui.nvim'
            -- '3rd/image.nvim' -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    { 'nvim-treesitter/nvim-treesitter' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },
    { 'williamboman/mason.nvim' },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim', {
            "nvim-telescope/telescope-live-grep-args.nvim",
            -- This will not install any breaking changes.
            -- For major updates, this must be adjusted manually.
            version = "^1.0.0",
        } }
    },
    { 'jose-elias-alvarez/null-ls.nvim' },
    { 'windwp/nvim-autopairs' },
    { 'akinsho/bufferline.nvim',        version = "*",                                dependencies = 'nvim-tree/nvim-web-devicons' },
    { 'terrortylor/nvim-comment' },
    { 'lewis6991/gitsigns.nvim' },
    { 'nvim-lualine/lualine.nvim',      dependencies = 'nvim-tree/nvim-web-devicons', 'linrongbin16/lsp-progress.nvim' },
    { 'simrat39/symbols-outline.nvim' },
    { 'akinsho/toggleterm.nvim' },
    { 'folke/which-key.nvim' },
    { 'kevinhwang91/promise-async' },
    { 'kevinhwang91/nvim-ufo',          requires = 'kevinhwang91/promise-async' },
    -- colorschemes
    { 'joshdick/onedark.vim' },
    { 'loctvl842/monokai-pro.nvim' },
    {
        'uloco/bluloco.nvim',
        priority = 1000,
        dependencies = { 'rktjmp/lush.nvim' }
    },
    { 'yashguptaz/calvera-dark.nvim' },
    {
        'eldritch-theme/eldritch.nvim',
        priority = 1000
    },
    {
        'sontungexpt/witch',
        priority = 1000
    },
    { 'alexmozaidze/palenight.nvim' },
    {
        'Tsuzat/NeoSolarized.nvim',
        priority = 1000 -- make sure to load this before all the other start plugins
    }
})
