return {
    -- 'nvim-java/nvim-java',
    "logrusx/nvim-java",
    branch = "add-curl-downloader",
    config = function()
        require("java").setup()
        vim.lsp.enable("jdtls")
    end,
}
