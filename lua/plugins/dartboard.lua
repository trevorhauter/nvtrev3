return {
    "markgandolfo/dartboard.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        -- Add current file to marks
        vim.keymap.set("n", "<leader>da", ":DartboardAdd<CR>", { desc = "[M]ark [A]dd file" })

        -- Remove current file from marks
        vim.keymap.set("n", "<leader>dr", ":DartboardRemove<CR>", { desc = "[M]ark [R]emove file" })

        -- Show marked files in Telescope
        vim.keymap.set("n", "<leader>dl", ":DartboardList<CR>", { desc = "[M]ark [S]how files" })

        -- Clear all marks
        vim.keymap.set("n", "<leader>dc", ":DartboardClear<CR>", { desc = "[M]ark [C]lear all" })

        require("dartboard").setup({
            use_default_keymaps = false,
        })

        vim.keymap.set("n", "<leader>1", ":DartboardGoto1<CR>", { desc = "Go to mark 1" })
        vim.keymap.set("n", "<leader>2", ":DartboardGoto2<CR>", { desc = "Go to mark 2" })
        vim.keymap.set("n", "<leader>3", ":DartboardGoto3<CR>", { desc = "Go to mark 3" })
        vim.keymap.set("n", "<leader>4", ":DartboardGoto4<CR>", { desc = "Go to mark 4" })
        vim.keymap.set("n", "<leader>5", ":DartboardGoto5<CR>", { desc = "Go to mark 5" })
        vim.keymap.set("n", "<leader>6", ":DartboardGoto6<CR>", { desc = "Go to mark 6" })
        vim.keymap.set("n", "<leader>7", ":DartboardGoto7<CR>", { desc = "Go to mark 7" })
        vim.keymap.set("n", "<leader>8", ":DartboardGoto8<CR>", { desc = "Go to mark 8" })
        vim.keymap.set("n", "<leader>9", ":DartboardGoto9<CR>", { desc = "Go to mark 9" })
    end,
}
