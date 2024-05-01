require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "typescript",
        "lua",
        "go",
        "tsx",
        "javascript",
        "bash",
        "c",
        "cpp",
        "cmake",
        "css",
        "csv",
        "diff",
        "git_config",
        "git_rebase",
        "http",
        "json",
        "llvm",
        "make",
        "matlab",
        "passwd",
        "python",
        "rust",
        "sql",
        "yaml",
        "udev"
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true
    }
}
