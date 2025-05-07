return {
  'nvim-treesitter/nvim-treesitter', 
  build = ':TSUpdate',
    
  config = function()
    require("nvim-treesitter.configs").setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "java", "css", "javascript", "html" },
          auto_install = true,
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
      })
  end

}
