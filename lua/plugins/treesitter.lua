return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "c_sharp",
                "cmake",
                "css",
                "dockerfile",
                "gitcommit",
                "gitignore",
                "html",
                "htmldjango",
                "java",
                "javascript",
                "json",
                "lua",
                "python",
                "query",
                "regex",
                "toml",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
