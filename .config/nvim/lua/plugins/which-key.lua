local wk = require("which-key")

wk.register(
    {
        { "<leader>c",  group = "Comment" },
        { "<leader>cl", desc = "Comment Line" },
        { "<leader>e",  desc = "File Manager" },
        { "<leader>f",  group = "Find" },
        { "<leader>fb", desc = "Find Buffer" },
        { "<leader>ff", desc = "Find File" },
        { "<leader>fh", desc = "Find Help" },
        { "<leader>fw", desc = "Find Text" },
        { "<leader>g",  group = "Git" },
        { "<leader>gb", desc = "Branches" },
        { "<leader>gc", desc = "Commits" },
        { "<leader>gs", desc = "Status" },
        { "<leader>h",  desc = "No highlight" },
        { "<leader>l",  group = "LSP" },
        { "<leader>lD", desc = "Hover diagnostic" },
        { "<leader>la", desc = "Action" },
        { "<leader>ld", desc = "Diagnostic" },
        { "<leader>lf", desc = "Format" },
        { "<leader>lr", desc = "Rename" },
        { "<leader>ls", desc = "Symbol" },
        { "<leader>o",  desc = "Git status" },
        { "<leader>t",  group = "Terminal" },
        { "<leader>tf", desc = "Float terminal" },
        { "<leader>th", desc = "Horizontal terminal" },
        { "<leader>w",  desc = "Save" },
        { "<leader>x",  desc = "Close Buffer" },
    },
    { prefix = "<leader>" }
)
