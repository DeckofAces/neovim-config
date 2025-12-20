return {
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {},
    config = function()
      -- Common on_attach
      local function on_attach(_, bufnr)
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "grd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "grr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "grn", vim.lsp.buf.rename, opts)
      end

      local capabilities = vim.lsp.protocol.make_client_capabilities()

      vim.lsp.config("lua_ls", {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      vim.lsp.config("ts_ls", {
        on_attach = on_attach,
        capabilities = capabilities,
      })

      vim.lsp.enable({
        "lua_ls",
        "ts_ls",
      })
    end,
  },
  {
    "j-hui/fidget.nvim",
    opts = {}
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        "ts_ls"
      },
    },
  },
}

