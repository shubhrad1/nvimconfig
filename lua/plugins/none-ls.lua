return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.pylint,
				null_ls.builtins.formatting.black,
				require("none-ls.diagnostics.eslint_d"),
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.golines,
        null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.goimports_reviser,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
		-- vim.keymap.set("n", "<leader>gf", function()
		-- 	if vim.bo.filetype == "go" then
		-- 		vim.lsp.buf.code_action({
		-- 			context = { only = { "source.organizeImports" } },
		-- 			apply = true,
		-- 		})
		-- 	end
		--
		-- 	vim.lsp.buf.format({ async = true })
		-- end, { desc = "Format file (plus organize Go imports)" })
	end,
}
