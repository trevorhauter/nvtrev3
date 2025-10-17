-- auto install & enable lsps with mason & mason-lspconfig
require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        "bashls",
        "clangd",
        "cssls",
        "emmet_language_server",
        "eslint",
        "html",
        "lua_ls",
        "pyright",
        "terraformls",
        "ts_ls",
    },
    automatic_enable = true,
})

-- set up auto completion for each server (along with any other extra configuration)

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- TODO: Fix this. This breaks on machine that isn't using java
-- require("java").setup()

vim.lsp.config("bashls", {
    capabilities = capabilities,
})

vim.lsp.config("jdtls", {
    capabilities = capabilities,
})

vim.lsp.config("clangd", {
    capabilities = capabilities,
})

vim.lsp.config("cssls", {
    capabilities = capabilities,
})

vim.lsp.config("emmet_language_server", {
    capabilities = capabilities,
})

vim.lsp.config("eslint", {
    capabilities = capabilities,
})

vim.lsp.config("html", {
    capabilities = capabilities,
})

vim.lsp.config("lua_ls", {
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

vim.lsp.config("pyright", {
    capabilities = capabilities,
})

vim.lsp.config("terraformls", {
    capabilities = capabilities,
})

vim.lsp.config("ts_ls", {
    capabilities = capabilities,
})
