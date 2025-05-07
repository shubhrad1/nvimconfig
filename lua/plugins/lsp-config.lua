return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig=require("lspconfig")
      lspconfig.lua_ls.setup({})
    end
  },
  {
    "williamboman/mason.nvim",
    version="^1.0.0",

    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    version="^1.0.0",

    config = function()
      require("mason-lspconfig").setup({
        automatic_installation=true,
        ensure_installed = { "lua_ls" }
      })
    end
  }
}
