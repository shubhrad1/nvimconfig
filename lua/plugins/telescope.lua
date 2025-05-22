return {
  {"nvim-telescope/telescope-ui-select.nvim"},
  {'nvim-telescope/telescope.nvim',
    dependencies = { "nvim-lua/plenary.nvim","folke/todo-comments.nvim" },
    config = function()
      require('telescope').setup({
      extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
       })
      local builtin=require("telescope.builtin")
      vim.keymap.set('n','<C-p>',builtin.find_files,{})
      vim.keymap.set('n','<leader>fg',builtin.live_grep,{})
      vim.keymap.set('n', '<leader>f', ':Telescope find_files<CR>', { desc = 'Find files' })
      vim.keymap.set('n','<leader>ft',':TodoTelescope<CR>',{ desc = 'Find todo comments' })
      require("telescope").load_extension("ui-select")
    end,
  },
}
