return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	lazy = false,
	config = function()
		local oil = require("oil")
		oil.setup()
		vim.keymap.set("n", "-", oil.toggle_float, {})
	end,
}
