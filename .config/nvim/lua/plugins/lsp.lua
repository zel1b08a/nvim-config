local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

vim.lsp.config('pyright', {})
vim.lsp.config('ts_ls', { capabilities = capabilities })
vim.lsp.config('prismals', {})
vim.lsp.config('cssls', {})
vim.lsp.config('golangci_lint_ls', {})
vim.lsp.config('rust_analyzer', {
    settings = {
        ["rust-analyzer"] = {
            diagnostics = { enable = true, experimental = { enable = true } }
        }
    }
})
vim.lsp.config('clangd', {})
vim.lsp.config('lua_ls', {
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path .. "/.luarc.json") or
            vim.loop.fs_stat(path .. "/.luarc.jsonc") then
            return
        end
        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config
            .settings.Lua, {
                runtime = { version = "LuaJIT" },
                workspace = {
                    checkThirdParty = false,
                    library = { vim.env.VIMRUNTIME }
                }
            })
    end,
    settings = { Lua = {} }
})
vim.lsp.config('bashls', {})
vim.lsp.config('cmake', {})
vim.lsp.config('docker_compose_language_service', {})
vim.lsp.config('yamlls', {})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        -- vim.keymap.set('n', '<Leader>sa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set('n', '<Leader>sr', vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set('n', '<Leader>sl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
        -- vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<Leader>la", vim.lsp.buf.code_action, opts)
        vim.keymap.set({ "n", "v" }, "<Leader>lf",
            function() vim.lsp.buf.format({ async = true }) end, opts)
    end
})

vim.api.nvim_create_user_command('FormatProjectGit', function()
    local function format_project()
        local handle = io.popen("git ls-files")
        local result = handle:read("*a")
        handle:close()

        for line in result:gmatch("[^\r\n]+") do
            vim.cmd("edit " .. line)
            vim.lsp.buf.format({ async = false })
            vim.cmd("write")
        end
    end
    format_project()
end, {})
