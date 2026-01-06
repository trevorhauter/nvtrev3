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
            pattern = { "python", "terraform" },
            callback = function()
                -- syntax highlighting, provided by Neovim
                vim.treesitter.start()
                -- folds, provided by Neovim
                vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                vim.wo.foldmethod = "expr"
                -- indentation, provided by nvim-treesitter
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
