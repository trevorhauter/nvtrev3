vim.keymap.set(
    "n",
    "<leader>dd",
    "<cmd> lua vim.diagnostic.open_float() <CR>",
    { desc = "View more detailed information of LSP diagnostic under cursor" }
)
vim.keymap.set("n", "<C-j>", "<cmd>e #<CR>", { desc = "Switch to previously edited file" })
