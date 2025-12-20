-- return { 
--   "nvim-treesitter/nvim-treesitter",
--   lazy = false,
--   build = ":TSUpdate",
--   config = function()
--     local config = require("nvim-treesitter.configs")
--     config.setup({
--       ensure_installed = {"lua", "javascript", "typescript", "html", "css", "vim", "vimdoc"},
--       auto_install = true,
--       highlight = { 
--         enable = true,
--       },
--       indent = { enable = true }
--     })
--   end
-- }

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  opts = {
    ensure_installed = {
      "lua",
      "javascript",
      "typescript",
      "html",
      "css",
      "vim",
      "vimdoc",
    },
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },
}

