vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4

-- Autoformat with stylua on save
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.lua",
    group = "AutoFormat",
    callback = function()
        vim.cmd("silent !stylua %")
        vim.cmd("edit")
    end,
})
