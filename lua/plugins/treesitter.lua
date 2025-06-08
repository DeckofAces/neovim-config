return { 
  "nvim-treesitter/nvim-treesitter",
  build= ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {"lua", "javascript", "typescript", "html", "css", "vim"},
      -- Auto install languages that are not installed
      auto_install = true,
      highlight = { 
        enable = true,
        use_languagetree = true,
      },
      indent = { enable = true }
    })
  end
}
