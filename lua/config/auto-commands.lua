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

-- AUTOREAD (I don't think this actually works)
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
    command = "if mode() != 'c' | checktime | endif",
    pattern = { "*" },
})
