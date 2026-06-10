return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
        require("tokyonight").setup({style = "night" })vim.cmd.colorscheme("tokyonight")

        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "tokyonight",
            callback = function()
                vim.api.nvim_set_hl(0, "LineNr", { fg = "#7aa2f7" })
                vim.api.nvim_sethl(0, "CursorLineNr", { fg = "#ff9e64", bold = true })
            end,
        })
    end,
}
