return {
  { "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      -- Standard Mason setup (No capabilities injection needed anymore)
      require("mason-lspconfig").setup({
          ensure_installed = { "clangd", "lua_ls", "basedpyright" },
          handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,
        }
      })
    end,
  }
}
