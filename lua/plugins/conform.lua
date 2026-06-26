return {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                c = { "clang-format" },
                javascript = { "eslint_d" },
                javascriptreact = { "eslint_d" },
                lua = { "stylua" },
                python = { "isort", "black" },
                terraform = { "terraform_fmt" },
                typescript = { "eslint_d" },
                typescriptreact = { "eslint_d" },
            },
        })

        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function(args)
                require("conform").format({ bufnr = args.buf })
            end,
        })
    end,
}
