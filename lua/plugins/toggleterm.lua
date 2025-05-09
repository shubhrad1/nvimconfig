return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<c-\>]],
			direction = "horizontal",
      shade_terminals=false,
      size = 10,
		})
		-- Keymaps for managing terminals
		local Terminal = require("toggleterm.terminal").Terminal

		-- Horizontal terminal
		local hterm = Terminal:new({ direction = "horizontal" })
		vim.keymap.set("n", "<leader>th", function()
			hterm:toggle()
		end, { desc = "Toggle horizontal terminal" })

		-- Vertical terminal
		local vterm = Terminal:new({ direction = "vertical" })
		vim.keymap.set("n", "<leader>tv", function()
			vterm:toggle()
		end, { desc = "Toggle vertical terminal" })

		-- Floating terminal
		local fterm = Terminal:new({ direction = "float" })
		vim.keymap.set("n", "<leader>tf", function()
			fterm:toggle()
		end, { desc = "Toggle floating terminal" })

		-- Keybinds in terminal mode
		vim.cmd([[
      tnoremap <Esc> <C-\><C-n>
      tnoremap <C-h> <C-\><C-n><C-w>h
      tnoremap <C-j> <C-\><C-n><C-w>j
      tnoremap <C-k> <C-\><C-n><C-w>k
      tnoremap <C-l> <C-\><C-n><C-w>l
    ]])

		-- Close terminal window (in normal mode, press <leader>tc)
		vim.keymap.set("n", "<leader>tc", function()
			vim.cmd("bd!") -- Force close buffer
		end, { desc = "Close terminal" })


	end,
}
