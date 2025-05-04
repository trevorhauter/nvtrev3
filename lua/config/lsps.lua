local lspconfig = require("lspconfig")
require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        -- For CSS, duh!
        "cssls",

        "clangd",

        -- Makes web development faster... mostly html tag creation stuff
        "emmet_language_server",

        -- For js, react, and ts linting.
        -- NOTE: REQUIRES ESLINT FILE IN ROOT DIR OF PROJECT
        "eslint",

        -- for html (NOT DJANGO TEMPLATES)
        "html",

        -- for lua!
        "lua_ls",

        -- for python
        "pyright",

        "solargraph",
        -- for javascript and typescript
        "ts_ls",
    },
    handlers = {
        -- this first function is the "default handler"
        -- it applies to every language server without a "custom handler"
        function(server_name)
            require("lspconfig")[server_name].setup({})
        end,

        --cssls
        cssls = function()
            --Enable (broadcasting) snippet capability for completion
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            lspconfig.cssls.setup({
                capabilities = capabilities,
            })
        end,

        --eslint
        eslint = function()
            lspconfig.eslint.setup({
                --- ...
                on_attach = function(client, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        command = "EslintFixAll",
                    })
                end,
            })
        end,

        --html
        --NOTE THIS ONLY WORKS FOR regular html... not django templates!
        html = function()
            --Enable (broadcasting) snippet capability for completion
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            lspconfig.html.setup({
                capabilities = capabilities,
            })
        end,

        lua_ls = function()
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = { "vim" },
                        },
                    },
                },
            })
        end,

        --pyright
        pyright = function()
            -- this should just be set up in a project specific pyrightconfig.json file
            lspconfig.pyright.setup({})
        end,
    },
})
