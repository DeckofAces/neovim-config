return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", 
      "MunifTanjim/nui.nvim",
  },
  lazy = false, 
  config = function()
    vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal left toggle<CR>', { desc = 'Open Neotre[E]' })
  end
}
