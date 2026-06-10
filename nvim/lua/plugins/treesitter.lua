return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    version = "false",
    build = ":TSUpdate",
    config = function ()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "rust", "lua", "vim", "vimdoc", "bash", "markdown"},
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
