return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", 
    "MunifTanjim/nui.nvim",
  },

  config = function()
     sources = {
    "filesystem",
    "buffers",
    "git_status",
    -- ...and any additional source
    }
    filesystem = {
      filtered_items = {
      visible = true,         -- Show filtered (hidden) items
      hide_dotfiles = false,  -- Show dotfiles like .git, .env
      hide_gitignored = false, -- Optional: also show .gitignored files
    },
    follow_current_file = { enabled = true },
    use_libuv_file_watcher = true,
--    components = {
--      git_status = require("neo-tree.sources.common.components").git_status,
--      icon = require("neo-tree.sources.common.components").icon,
--      name = require("neo-tree.sources.common.components").name,
--    }
--    renderers = {
--      file = {
--        { "icon" },
--        { "name", use_git_status_colors = true },
--      }
--      directory = {
--        { "icon" },
--        { "name", use_git_status_colors = true },
--      }
--    }
    }
    vim.keymap.set('n','<C-e>',':Neotree filesystem reveal left<CR>',{})
    vim.keymap.set("n", "<C-e>gs", ":Neotree git_status left<CR>", { desc = "Neo-tree Git Status" })
  end

  }
