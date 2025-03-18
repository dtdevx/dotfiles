return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      -- Auto install is an option instead of "ensure installed".
      -- This assures, that if there is no existing lsp server for
      -- the current language, it will be automagically installed.
      -- I'll currently keep that turned off to not mess up my
      -- setup here...
      --  auto_install = true,
      ensure_installed = { "lua", "javascript", "typescript", "php", "html", "css", "go", "astro" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
