-- Function to disable eslint for the current buffer
_G.disable_eslint_for_current_buffer = function()
    local clients = vim.lsp.get_active_clients({ bufnr = 0 })

    for _, client in ipairs(clients) do
        if client.name == "eslint" then
            -- Detach ESLint from the current buffer
            vim.lsp.buf_detach_client(0, client.id)
            print("ESLint disabled for current buffer.")
        end
    end

    -- Disable ESLintFixAll on save for this buffer
    vim.api.nvim_clear_autocmds({ buffer = 0, event = "BufWritePre" })
end

-- Set keybinding to disable eslint in the current buffer
vim.api.nvim_set_keymap(
    "n",
    "<leader>es", -- Replace <leader>de with your preferred key combo
    "<cmd>lua disable_eslint_for_current_buffer()<CR>",
    { noremap = true, silent = true }
)

-- AUTO FORMATTING STUFF
-- Pretty sure this is a garbage way to do this but w/e for now
vim.api.nvim_create_augroup("AutoFormat", {})

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.py",
    group = "AutoFormat",
    callback = function()
        vim.cmd("silent !black --quiet %")
        vim.cmd("edit")
    end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.lua",
    group = "AutoFormat",
    callback = function()
        vim.cmd("silent !stylua %")
        vim.cmd("edit")
    end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.c",
    group = "AutoFormat",
    callback = function()
        vim.cmd("silent! !clang-format -i %")
        vim.cmd("edit")
    end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "*.js", "*.ts", "*.tsx", "*.jsx" },
    group = "AutoFormat",
    callback = function()
        vim.cmd("silent! !npx eslint % --fix")
        vim.cmd("edit")
    end,
})

-- vim.api.nvim_create_autocmd("BufWritePost", {
--     pattern = { "*.js", "*.ts", "*.tsx", "*.jsx" },
--     group = "AutoFormat",
--     callback = function()
--         vim.cmd("silent! !npx prettier --write %")
--         vim.cmd("edit")
--     end,
-- })

-- END AUTO FORMATTING STUFF

-- SPECIAL KEY MAPS
-- Add these remaps only when the buffer is modifiable
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*", -- You can specify a specific file type or pattern here
    callback = function()
        if vim.bo.modifiable then
            vim.api.nvim_buf_set_keymap(0, "v", "<C-j>", ":m '>+1<CR>gv=gv", {})
            vim.api.nvim_buf_set_keymap(0, "v", "<C-k>", ":m '<-2<CR>gv=gv", {})
        end
    end,
})

-- END SPECIAL KEY MAPS
