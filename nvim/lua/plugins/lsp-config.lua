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
        ensure_installed = { "lua_ls", "ts_ls", "intelephense", "astro", "tailwindcss", "angularls", "html", "gopls" }
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


      local lspconfig = require("lspconfig")

      lspconfig.ts_ls.setup({
        capabilities = capabilities
      })

      -- Angular
      local angularls_path = mason_registry.get_package('angular-language-server'):get_install_path()
      local angularls_cmd = {
        'ngserver',
        '--stdio',
        '--tsProbeLocations',
        table.concat({
          angularls_path,
          vim.uv.cwd(),
        }, ','),
        '--ngProbeLocations',
        table.concat({
          angularls_path .. '/node_modules/@angular/language-server',
          vim.uv.cwd(),
        }, ','),
      }
      lspconfig.angularls.setup({
        cmd = angularls_cmd,
        on_new_config = function(new_config, new_root_dir)
          new_config.cmd = angularls_cmd
        end,
        capabilities = capabilities
      })

      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.astro.setup({
        capabilities = capabilities
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities
      })
      lspconfig.gopls.setup({
        capabilities = capabilities
      })

      -- Lua Language Server
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      })

      -- PHP Language Server
      lspconfig.intelephense.setup({
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

