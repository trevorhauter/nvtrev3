return {
	-- TODO: switch this url back over when multi-project lists are added
	"trevorhauter/dartboard.nvim",
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
	end,
}
