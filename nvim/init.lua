vim.g.mapleader = " "
vim.g.maplocalleader = " "


vim.opt.clipboard = 'unnamedplus'   -- use system clipboard
vim.opt.completeopt = {'menu','menuone','noselect'}


-- Tab
 
vim.opt.tabstop = 4		        	-- number of visual spaces per tab
vim.opt.softtabstop = 4 	    	-- number of spaces in tab when editing
vim.opt.shiftwidth = 4	        	-- insert 4 spaces on a tab
vim.opt.expandtab = true	    	-- tabs are spaces, mainly because of Python


-- UI config
--
vim.opt.number = true 		    	-- show absolute number
vim.opt.relativenumber = true		-- add numbers to each line on the left

-- Vertical cursor
--
local tty_cursor = vim.api.nvim_create_augroup("TTYCursor", { clear = true})

vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
	group = tty_cursor,
	pattern = "*",
    callback = function()
        io.write("\27[?0c")
    end,
})

------- Bootstrap lazy.nvim ----
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")


vim.opt.termguicolors = true
