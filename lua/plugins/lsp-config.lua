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

        vim.keymap.set("n", "grn", vim.lsp.buf.rename, { buffer = bufnr, desc = 'LSP: [R]e[n]ame' })
        vim.keymap.set("n", "grd", require('telescope.builtin').lsp_definitions, { buffer = bufnr, desc = 'LSP: [G]oto [D]efinition' })
        vim.keymap.set("n", "grD", vim.lsp.buf.declaration, { buffer = bufnr, desc = 'LSP: [G]oto [D]eclaration' })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = 'LSP: Hover definition' })
        vim.keymap.set("n", "grr", require('telescope.builtin').lsp_references, { buffer = bufnr, desc = 'LSP: [G]oto [R]eferences' })
        vim.keymap.set({"n", "x"}, "gra", vim.lsp.buf.code_action, { buffer = bufnr, desc = 'LSP: [G]oto Code [A]ction' })
        vim.keymap.set("n", "gri", require('telescope.builtin').lsp_implementations, { buffer = bufnr, desc = 'LSP: [G]oto [I]mplementation' })
        vim.keymap.set("n", "gO", require('telescope.builtin').lsp_document_symbols, { buffer = bufnr, desc = 'LSP: Open Document Symbols' })
        vim.keymap.set("n", "gW", require('telescope.builtin').lsp_dynamic_workspace_symbols, { buffer = bufnr, desc = 'LSP: Open Workspace Symbols' })
        vim.keymap.set("n", "grt", require('telescope.builtin').lsp_type_definitions, { buffer = bufnr, desc = 'LSP: [G]oto [T]ype Definition' })
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

