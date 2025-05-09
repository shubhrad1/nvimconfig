return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"mrbjarksen/neo-tree-diagnostics.nvim",
	},
	config = function()
		require("neo-tree").setup({
			opts = {
				window = {
					position = "left",
					width = 40,
				},
			},
			sources = {
				"filesystem",
				"buffers",
				"git_status",
				"diagnostics",
			},
			source_selector = {
				winbar = true,
				statusline = false,
			},
			filesystem = {
				filtered_items = {
					visible = true, -- Show filtered (hidden) items
					hide_dotfiles = false, -- Show dotfiles like .git, .env
					hide_gitignored = false, -- Optional: also show .gitignored files
				},
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
			},
			diagnostics = {
				auto_preview = {
					enabled = false, -- Disable automatic preview of diagnostics
				},
				bind_to_cwd = true, -- Tie diagnostics to current working directory
				diag_sort_function = "severity", -- Sort diagnostics by severity
				follow_current_file = {
					enabled = true, -- Automatically track diagnostics for current file
					expand_followed = true,
				},
				group_dirs_and_files = true, -- Group files and directories
				group_empty_dirs = true, -- Group empty directories
				show_unloaded = true, -- Show diagnostics from unopened files
				refresh = {
					delay = 100, -- Debounce refresh to avoid lag
					event = "vim_diagnostic_changed", -- Refresh on LSP diagnostic change
					max_items = 10000, -- Limit to prevent performance issues
				},
				symbols = {
					hint = "",
					info = "",
					warn = "",
					error = "",
				},
				highlights = {
					hint = "DiagnosticHint",
					info = "DiagnosticInfo",
					warn = "DiagnosticWarn",
					error = "DiagnosticError",
				},
			},
		})
		vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>gs", ":Neotree git_status left<CR>", { desc = "Neo-tree Git Status" })
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
		vim.keymap.set("n", "<leader>db", function()
			vim.cmd("Neotree diagnostics toggle bottom")
		end, { silent = true, noremap = true })
	end,
}
