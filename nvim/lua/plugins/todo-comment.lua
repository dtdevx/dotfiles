return {
  "folke/todo-comments.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    local todoComments = require("todo-comments")
    todoComments.setup({})
  end,
}
