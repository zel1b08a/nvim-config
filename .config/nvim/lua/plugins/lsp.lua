local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Sntup language servers.
local lspconfig = require('lspconfig')

lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}
lspconfig.prismals.setup {}
lspconfig.cssls.setup { capabilities = capabilities }
lspconfig.golangci_lint_ls.setup {}
lspconfig.rust_analyzer.setup {
    settings = {
        ['rust-analyzer'] = {
            diagnostics = {
                enable = true,
                experimental = { enable = true }
            }
        }
    }
}
lspconfig.clangd.setup {}
lspconfig.lua_ls.setup {
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            return
        end

        client.config.settings.Lua = vim.tbl_deep_extend(
            'force',
            client.config.settings.Lua,
            {
                runtime = {
                    -- Tell the language server which version of Lua you're using
                    -- (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT'
                },
                -- Make the server aware of Neovim runtime files
                workspace = {
                    checkThirdParty = false,
                    library = {
                        vim.env.VIMRUNTIME
                        -- Depending on the usage, you might want to add additional paths here.
                        -- "${3rd}/luv/library"
                        -- "${3rd}/busted/library",
                    }
                    -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                    -- library = vim.api.nvim_get_runtime_file("", true)
                }
            }
        )
    end,
    settings = {
        Lua = {}
    }
}
lspconfig.bashls.setup {}
lspconfig.cmake.setup {}
lspconfig.docker_compose_language_service.setup {}
lspconfig.yamlls.setup {}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>lD', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>ld', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach',
    {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback =
            function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                -- vim.keymap
                --     .set('n', '<Leader>sa', vim.lsp.buf.add_workspace_folder, opts)
                -- vim.keymap.set('n', '<Leader>sr', vim.lsp.buf.remove_workspace_folder,
                --                opts)
                -- vim.keymap.set('n', '<Leader>sl', function()
                --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                -- end, opts)
                -- vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.rename, opts)
                vim.keymap.set({ 'n', 'v' }, '<Leader>la', vim.lsp.buf.code_action, opts)
                vim.keymap.set({ 'n', 'v' }, '<Leader>lf', function() vim.lsp.buf.format { async = true } end, opts)
            end
    }
)

-- local servers = { 'pyright', 'rust_analyzer', 'clangd' }
-- for _, lsp in pairs(servers) do
--     require('lspconfig')[lsp].setup {
--         on_attach = on_attach,
--         flags = { debounce_text_changes = 150 }
--     }
-- end
