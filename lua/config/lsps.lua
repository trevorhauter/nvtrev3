local lspconfig = require("lspconfig")

-- auto install & enable lsps with mason & mason-lspconfig
require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        "clangd",
        "cssls",
        "emmet_language_server",
        "eslint",
        "html",
        "lua_ls",
        "pyright",
        "ts_ls",
    },
    automatic_enable = false,
})

-- set up auto completion for each server (along with any other extra configuration)

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require("blink.cmp").get_lsp_capabilities()

require("java").setup()

lspconfig.jdtls.setup({
    capabilities = capabilities,
})

lspconfig.clangd.setup({
    capabilities = capabilities,
})

lspconfig.cssls.setup({
    capabilities = capabilities,
})

lspconfig.emmet_language_server.setup({
    capabilities = capabilities,
})

lspconfig.eslint.setup({
    capabilities = capabilities,
})

lspconfig.html.setup({
    capabilities = capabilities,
})

lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = {

        Lua = {

            diagnostics = {

                -- Get the language server to recognize the `vim` global

                globals = { "vim" },
            },
        },
    },
})

lspconfig.pyright.setup({
    capabilities = capabilities,
})

lspconfig.ts_ls.setup({
    capabilities = capabilities,
})
