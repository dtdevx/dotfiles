return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "intelephense", "astro", "tailwindcss", "angularls", "html", "gopls", "prismals" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local ok, mason_registry = pcall(require, 'mason-registry')
      if not ok then
        vim.notify 'mason-registry could not be loaded'
        return
      end

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.lsp.config('ts_ls', {
        capabilities = capabilities
      })
      vim.lsp.config('angularls', {
        capabilities = capabilities
      })
      vim.lsp.config('html', {
        capabilities = capabilities
      })
      vim.lsp.config('lua_ls', {
        capabilities = capabilities
      })
      vim.lsp.config('astro', {
        capabilities = capabilities
      })
      vim.lsp.config('tailwindcss', {
        capabilities = capabilities
      })
      vim.lsp.config('gopls', {
        capabilities = capabilities
      })
      vim.lsp.config('prismals', {
        capabilities = capabilities
      })

      -- Lua Language Server
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      })

      -- PHP Language Server
      vim.lsp.config('intelephense', {
        capabilities = capabilities,
        settings = {
          intelephense = {
            stubs = {"bcmath", "bz2", "Core", "curl", "date", "dom", "fileinfo", "filter", "gd", "gettext", "hash", "iconv", "imap", "intl", "json", "laravel", "libxml", "mbstring", "mcrypt", "mysql", "mysqli", "password", "pcntl", "pcre", "PDO", "pdo_mysql", "Phar", "readline", "regex", "session", "SimpleXML", "sockets", "sodium", "standard", "superglobals", "tokenizer", "xml", "xdebug", "xmlreader", "xmlwriter", "yaml", "zip", "zlib", "wordpress", "woocommerce", "acf-pro", "wordpress-globals", "wp-cli", "genesis", "polylang"},
          }
        }
      })

      -- Key mappings for LSP functions
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}

