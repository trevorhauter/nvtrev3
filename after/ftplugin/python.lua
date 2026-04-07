local function get_visual_selection()
    -- Yank the highlighted text then pull it out of the register
    vim.cmd.normal({ '"zy', bang = true })
    local selection = vim.fn.getreg("z")
    vim.cmd("TermExec cmd='djt " .. selection .. "'")
end

-- Django mapping to run tests easily in visual mode
vim.keymap.set("v", "<cr><cr>", get_visual_selection)
