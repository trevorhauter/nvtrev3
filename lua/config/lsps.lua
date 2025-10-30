-- auto install & enable lsps with mason & mason-lspconfig
require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        "bashls",
        "clangd",
        "cssls",
        "emmet_language_server",
        "eslint",
        "gh_actions_ls",
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

vim.lsp.config("gh_actions_ls", {
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

-- Copied from https://github.com/neovim/nvim-lspconfig/blob/c96ec574eacfff8ad8dd4bdb6e96a1b3dbd268fd/lua/lspconfig/server_configurations/pyright.lua#L10-L17
local root_files = {
    "pyrightconfig.json",
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
}

vim.lsp.config("pyright", {
    capabilities = capabilities,
    root_dir = vim.fs.root(vim.loop.cwd(), root_files),
})

vim.lsp.config("terraformls", {
    capabilities = capabilities,
})

vim.lsp.config("ts_ls", {
    capabilities = capabilities,
})
