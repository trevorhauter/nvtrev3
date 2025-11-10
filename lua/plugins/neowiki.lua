return {
    "echaya/neowiki.nvim",
    opts = {
        wiki_dirs = {
            -- neowiki.nvim supports both absolute and tilde-expanded paths
            { name = "work", path = "~/neowiki" },
        },
    },
    keys = {
        { "<leader>ww", "<cmd>lua require('neowiki').open_wiki()<cr>", desc = "Open Wiki" },
        { "<leader>wW", "<cmd>lua require('neowiki').open_wiki_floating()<cr>", desc = "Open Wiki in Floating Window" },
    },
}
