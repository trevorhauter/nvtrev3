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

-- Do any extra configuration to lsps here
vim.lsp.config.lua_ls = {
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
        },
    },
}

-- set up auto completion for each server

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require("blink.cmp").get_lsp_capabilities()

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
})

lspconfig.pyright.setup({
    capabilities = capabilities,
})

lspconfig.ts_ls.setup({
    capabilities = capabilities,
})
