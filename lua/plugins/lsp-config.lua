
-- lsp_config.lua

-- Setup mason & mason-lspconfig as before
return {
  {
    "williamboman/mason.nvim",
    version = "^1.0.0",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    version = "^1.0.0",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "gopls", "ts_ls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    -- Remove or keep version spec as you prefer
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- global on_attach/keymaps etc
      local function on_attach(client, bufnr)
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      end

      -- Now use vim.lsp.config + vim.lsp.enable for each server

      -- gopls
      vim.lsp.config("gopls", {
        capabilities = capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_markers = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            -- completeUnimported = true,
            usePlaceholders = true,
            analyses = { unusedparams = true },
          },
        },
        on_attach = on_attach,
      })
      vim.lsp.enable("gopls")

      -- lua_ls
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })
      vim.lsp.enable("lua_ls")

      -- pyright
      vim.lsp.config("pyright", {
        capabilities = capabilities,
        cmd = { vim.fn.stdpath("data") .. "/mason/bin/pyright-langserver", "--stdio" },
        root_dir = vim.fs.dirname(vim.fs.find({ "pyproject.toml", "setup.py", "requirements.txt", ".git" }, { upward = true })[1]) or vim.fn.getcwd(),
        filetypes = { "python" },
        settings = {
          python = {
            pythonPath = function()
            local venv = vim.fn.getenv("VIRTUAL_ENV")
            if venv and venv ~= vim.NIL and #venv > 0 then
              return venv .. "/bin/python"
            end
              return vim.fn.exepath("python3") or "python3"
            end,
            analysis = {
              typeCheckingMode = "off",
              autoSearchPaths = true,
              diagnosticMode = "workspace",
              useLibraryCodeForTypes = true,
            },
          },
        },
        on_attach = on_attach,
      })
      vim.lsp.enable("pyright")

      -- ts_ls
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        init_options = {
          preferences = { disableSuggestions = true },
        },
        on_attach = on_attach,
      })
      vim.lsp.enable("ts_ls")

      --clangd
      vim.lsp.config("clangd", {
        capabilities = capabilities,
        filetypes = { "c", "cpp", "objc", "objcpp" },
        on_attach = on_attach,
      })
      vim.lsp.enable("clangd")

       -- diagnostic signs
      -- local signs = { Error = "", Warn = "", Hint = "", Info = "" }
      -- for type, icon in pairs(signs) do
      --   local hl = "DiagnosticSign" .. type
      --   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      -- end
      vim.diagnostic.config({
        virtual_text=false,
        signs = {
          text={
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT]= "",
            [vim.diagnostic.severity.INFO] = "",
          },
        },
        update_in_insert = true,
        severity_sort = true,
        float = {
          border = "rounded",
        },
      })
    end,
  },
}
