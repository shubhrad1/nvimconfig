-- return {
--   "catppuccin/nvim",
--   lazy = false,
--   name = "catppuccin",
--   priority = 1000,
--   config = function()
--     require("catppuccin").setup({
--       flavour="mocha", -- latte, frappe, macchiato, mocha
--     })
--     vim.cmd.colorscheme "catppuccin"
--   end
-- }
--
--
return {
  "ellisonleao/gruvbox.nvim", 
  priority = 1000 ,
  lazy = false,
  name = "gruvbox",
  config = function()
    require("gruvbox").setup({
      contrast = "soft",
      --palette = "mix",
      -- background = {
      --   light = "soft",
      --   dark = "hard",
      -- },
    })
    vim.cmd.colorscheme "gruvbox"
  end
}
