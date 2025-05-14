return {
	"mfussenegger/nvim-dap",
	dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio", "leoluz/nvim-dap-go","mfussenegger/nvim-dap-python" },
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dapui").setup()
		require("dap-go").setup()
    require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

		vim.fn.sign_define("DapBreakpoint", {
			text = "●",
			texthl = "DapBreakpoint",
			linehl = "",
			numhl = "",
		})

		vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#FF0000" })

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<C-d>b", dap.toggle_breakpoint, {noremap=true})
		vim.keymap.set("n", "<C-d>c", dap.continue, {noremap=true})
    vim.keymap.set("n","<C-d>r", ":lua require('dapui').open({reset=true})<CR>",{noremap=true})
	end,
}
