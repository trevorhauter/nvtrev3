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
