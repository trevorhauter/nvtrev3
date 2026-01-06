return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        local treesitter = require("nvim-treesitter")

        treesitter.install({
            "bash",
            "c",
            "c_sharp",
            "cmake",
            "cpp",
            "css",
            "dockerfile",
            "gitcommit",
            "gitignore",
            "hcl",
            "html",
            "htmldjango",
            "java",
            "javascript",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "php",
            "python",
            "query",
            "regex",
            "sql",
            "terraform",
            "toml",
            "typescript",
            "vim",
            "vimdoc",
            "yaml",
        })

        -- For treesitter
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                if vim.list_contains(treesitter.get_installed(), vim.treesitter.language.get_lang(args.match)) then
                    vim.treesitter.start(args.buf)
                end
            end,
        })
    end,
}
